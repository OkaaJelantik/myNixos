{ ... }: {
  flake.homeModules.zsh = { pkgs, ... }: {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        nixos-update = "sudo nixos-rebuild switch --flake /home/lann/myNixos/.";
	      nixos-test = "sudo nixos-rebuild test --flake /home/lann/myNixos/.";
	      home-update = "home-manager switch --flake /home/lann/myNixos/.";
	      home-test = "home-manager build --flake /home/lann/myNixos/. && /home/lann/myNixos/result/activate";
	      ll = "ls -l";
      };

      history.size = 10000;
      history.ignoreAllDups = true;
      history.path = "$HOME/.zsh_history";
      history.ignorePatterns = ["rm *" "pkill *" "cp *"];
    };

    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
	      command_timeout = 1300;
	      scan_timeout = 50;
	      format = "$username$hostname$directory$git_branch$git_status$nix_shell$character";
          character = {
          success_symbol = "[❯](bold green)";
          error_symbol = "[❯](bold red)";
        };
        username = {
          show_always = false;
          format = "[$user]($style) ";
        };
        hostname = {
          ssh_only = true;
          format = "[@$hostname]($style) ";
        };
        directory = {
          truncation_length = 3;
          truncate_to_repo = true;
          format = "[$path]($style) ";
        };
        git_branch = {
          format = "[$symbol$branch]($style) ";
        };
        git_status = {
          format = "([$all_status$ahead_behind]($style) )";
        };
        nix_shell = {
          format = "[$symbol]($style)";
        };
      };
    };
  };
}
