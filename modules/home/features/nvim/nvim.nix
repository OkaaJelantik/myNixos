{ ... }: {
  flake.homeModules.nvim = { config, lib, pkgs, ... }: 
  let 
    cfg = config.home.nvim;
  in {
    options.home.nvim = {
      enable = lib.mkEnableOption "Neovim Editor";
    };

    config = lib.mkIf cfg.enable {
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
  };
}

