{ pkgs, ... }: {
    security.sudo.extraRules = [
      {
        users = [ "yahya" ];
        commands = [
          {
            command = "${pkgs.kbd}/bin/openvt";
            options = [ "NOPASSWD" ];
          }
          {
            command = "${pkgs.kbd}/bin/chvt";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  }
