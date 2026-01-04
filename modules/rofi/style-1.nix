# rofi/style-1.nix
{ mkLiteral }:

{
  "*" = {
    background-color = mkLiteral "transparent";
    text-color = mkLiteral "@foreground";
    # Import the Matugen colors generated in ~/.config/rofi/colors.rasi
    "@import" = "colors.rasi";
  };

  "window" = {
    background-color = mkLiteral "@background";
    border = mkLiteral "1px solid";
    border-color = mkLiteral "@border-color";
    border-radius = mkLiteral "12px";
    padding = mkLiteral "10px";
    width = mkLiteral "30%";
    location = mkLiteral "center";
    x-offset = mkLiteral "0";
    y-offset = mkLiteral "0";
  };

  "mainbox" = {
    background-color = mkLiteral "transparent";
  };

  "inputbar" = {
    children = mkLiteral "[ prompt, entry ]";
    background-color = mkLiteral "@normal-background";
    text-color = mkLiteral "@normal-foreground";
    border = mkLiteral "0px 0px 2px 0px solid";
    border-color = mkLiteral "black";
    border-radius = mkLiteral "0px";
    padding = mkLiteral "8px";
    margin = mkLiteral "0px 0px 10px 0px";
  };

  "prompt" = {
    background-color = mkLiteral "transparent";
    text-color = mkLiteral "@normal-foreground";
    padding = mkLiteral "5px";
    margin = mkLiteral "0px 5px 0px 0px";
  };

  "entry" = {
    background-color = mkLiteral "transparent";
    text-color = mkLiteral "@normal-foreground";
    placeholder-color = mkLiteral "@normal-foreground";
    expand = mkLiteral "true";
    padding = mkLiteral "5px";
  };

  "listview" = {
    background-color = mkLiteral "transparent";
    columns = 1;
    lines = 10;
    spacing = mkLiteral "5px";
    scrollbar = mkLiteral "false";
    fixed-height = mkLiteral "false";
  };

  "element" = {
    background-color = mkLiteral "transparent";
    text-color = mkLiteral "@normal-foreground";
    padding = mkLiteral "8px";
    border-radius = mkLiteral "8px";
    orientation = mkLiteral "horizontal";
  };

  "element-icon" = {
    size = mkLiteral "1.2em";
    margin = mkLiteral "0px 10px 0px 0px";
    background-color = mkLiteral "transparent";
  };

  "element-text" = {
    background-color = mkLiteral "transparent";
    text-color = mkLiteral "@normal-foreground";
    expand = mkLiteral "true";
    vertical-align = mkLiteral "0.5";
  };

  "element normal.normal" = {
    background-color = mkLiteral "@normal-background";
    text-color = mkLiteral "@normal-foreground";
  };

  "element selected.normal" = {
    background-color = mkLiteral "@selected-normal-background";
    text-color = mkLiteral "@selected-normal-foreground";
    border-radius = mkLiteral "8px";
  };

  "element alternate.normal" = {
    background-color = mkLiteral "@alternate-normal-background";
    text-color = mkLiteral "@alternate-normal-foreground";
  };
}
