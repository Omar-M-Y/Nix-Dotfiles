{ pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    
    # Optional: If you use extraLuaConfig, you can add it here too
    # extraLuaConfig = ''
    #   -- config here
    # '';
  };

  # Link the configuration files
  # This takes everything in the current directory (modules/nvim) 
  # and puts it in ~/.config/nvim
  xdg.configFile."nvim".source = lib.cleanSourceWith {
    src = ./.;
    # Filter out this default.nix file so it doesn't get copied to your config folder
    filter = name: type: let baseName = baseNameOf (toString name); in baseName != "default.nix";
  };
}
