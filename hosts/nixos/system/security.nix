{ ... }: {
    security.wrappers.openvt = {
      owner = "root";
      group = "root";
      capabilities = "cap_sys_tty_config+ep";
      source = "${pkgs.kbd}/bin/openvt";
    };
  }
