.PHONY: build build-docker build-gh release

build:
	@echo "Run locally: make build-docker"
	@echo "Run in GitHub: make build-gh"

build-docker:
	docker run --rm --platform linux/amd64 --cap-add=SYS_ADMIN --security-opt seccomp=unconfined --security-opt apparmor=unconfined -v $(PWD):/work -w /work nixos/nix nix build --option sandbox false --extra-experimental-features "nix-command flakes" .#nixosConfigurations.nixos-custom-iso.config.system.build.isoImage

build-gh:
	gh workflow run build.yml
	@echo "Check workflow: https://github.com/$(shell git config --get remote.origin.url | sed 's|.*github.com[:/]||;s|\.git$$||')/actions"

release: TAG ?= v1.0.0
release:
	git tag -a $(TAG) -m "Release $(TAG)"
	git push origin $(TAG)
	@echo "Release $(TAG) will be created with ISO attached"
