{ config, pkgs, inputs, ... }: {

  hardware.cpu.intel.updateMicrocode = true;

  zramSwap = {
    enable = true;
    memoryPercent = 100;
    algorithm = "zstd";
  };

}
