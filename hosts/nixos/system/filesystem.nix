# modules/linux/system.nix <- System Packages
{ pkgs, inputs, ... }: {
  fileSystems = {
    "/mnt/Windows" = {
      device = "/dev/disk/by-uuid/5E9446AA9446848D";
      fsType = "ntfs3";
      options = [ "nofail" "uid=1000" "gid=100" "rw" "umask=000" ];
    };
    "/mnt/Backup" = {
      device = "/dev/disk/by-uuid/E85E9A215E99E898";
      fsType = "ntfs3";
      options = [ "rw" "uid=1000" "gid=100" "umask=0022" "nofail" ];
    };
    "/mnt/Work" = {
      device = "/dev/disk/by-uuid/C69E36119E35FA8F";
      fsType = "ntfs3";
      options = [ "rw" "uid=1000" "gid=100" "umask=0022" "nofail" ];
    };
    "/mnt/Games" = {
      device = "/dev/disk/by-uuid/94FA6723FA6700BA";
      fsType = "ntfs3";
      options = [
        "rw"
        "uid=1000"
        "gid=100"
        "dmask=0022"
        "fmask=0022"
        "windows_names"
        "nofail"
      ];
    };
  };
}
