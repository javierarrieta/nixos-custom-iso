{ pkgs, lib, ... }: {
  # Add custom packages to the live environment
  environment.systemPackages = with pkgs; [
    neovim git gparted testdisk
  ];

  # Pre-configure networking
  networking.networkmanager.enable = true;
  networking.wireless.enable = lib.mkForce false;

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJAxtDTZvN/YqOQC1nOGahb/qLp35iYnBTPaGld6/N6k root@host" 
  ];

  # Optional: Embed your SSH public key for remote access
  users.users.nixos.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJAxtDTZvN/YqOQC1nOGahb/qLp35iYnBTPaGld6/N6k user@host"
  ];

  services.openssh.settings.PermitRootLogin = "yes";

  # Allow unfree software (like drivers)
  nixpkgs.config.allowUnfree = true;
}
