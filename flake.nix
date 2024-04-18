{
  description = "DoomDuck's nixos config ^^";

  inputs = {
	# Use a stable nixos base
    nixpkgs.url = "github:nixos/23.11";
  };

  outputs = { self, nixpkgs }: {
	# My framework 16 computer
	nixosConfigurations.framous = nixpkgs.lib.nixosSystem {
	  system = "x86_64-linux";

	  modules = [
		({pkgs, ...} : {

		  # System packages
		  environment.systemPackages = with pkgs; [
			# Text editor
			neovim

			# CLI tools
			git
			bat
			eza
			ripgrep
		  ];

		  # Users
		  users.users.duck = {
			isNormalUser = true;
		  };

		  programs.sway.enable = true;
		})
	  ];
	};
  };
}
