{ config, ... }: {
  flake.homeModules.nvim = { config, pkgs,  ... }: {
    home.file.".config/nvim/init.lua".source = 
      config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/myNixos/modules/home/features/nvim/init.lua";

    home.packages = with pkgs; [
     neovim
     tree-sitter
     go
     git
     ripgrep
     fzf
     fd
   ];

  };
}

