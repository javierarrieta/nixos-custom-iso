# Build Commands

```bash
nix build .#nixosConfigurations.nixos-custom-iso.config.system.build.iso
nix flake check
```

# Code Style

Nix configuration files follow flake conventions from `.agent/skills/nix-best-practices/SKILL.md`:

- Use 2-space indentation
- List all inputs in outputs: `outputs = { self, nixpkgs, ... }:`
- Chain overlays with `follows` to avoid duplicate nixpkgs downloads
- Use `with pkgs; [ ]` for package lists
- Handle unfree packages via nixpkgs-unfree or `config.allowUnfree = true`
- Name flakes descriptively in `description` field
- Configuration modules in separate `.nix` files, imported in flake.nix
- Comments use `#` prefix, keep them minimal
