{ config, pkgs, inputs, ... }: {
    boot = {
        loader = {
            timeout = 5;
            systemd-boot.enable = false;
            grub.enable = false;
            limine = {
                enable = true;
                secureBoot.enable = true;
                extraConfig = ''
                
                    DEFAULT_ENTRY: 3
                    TERM_BACKDROP: 000000
                    INTERFACE_COLOUR: 000000
                    GRAPHICS: yes

                    # Windows 11
                    /Systems/Windows 11
                    protocol: efi_chainload
                    image_path: guid(8bdeacd3-121c-4398-a79e-8b343f2ba1f9):/EFI/Microsoft/Boot/bootmgfw.efi
                
                '';
            };
        };
        plymouth = {
            enable = true;
            theme = "deus_ex";
            themePackages = [
                (pkgs.adi1090x-plymouth-themes.override {
                selected_themes = [ "deus_ex" ];
                })
            ];
        };
        supportedFilesystems = [ "ntfs" ];
        kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-lts;
        kernelModules = [
            "ntsync"
        ];
        consoleLogLevel = 0;
        initrd = {
            kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
            verbose = false;
        };
        kernelParams = [
            "split_lock_detect=off"
            "transparent_hugepage=madvise"
            "nvidia-drm.modeset=1"
            "nvidia-drm.fbdev=1"
            "quiet"
            "splash"
            "loglevel=0"
            "rd.systemd.show_status=false"
            "systemd.show_status=false"
            "rd.udev.log_level=0"
            "udev.log_priority=0"
            "nvme_core.default_ps_max_latency_us=0" # For Corsair SSD
            "acpi_enforce_resources=lax"
            "vt.global_cursor_default=0"
        ];
        kernel.sysctl = {
            "net.core.default_qdisc" = "cake";
            "net.ipv4.tcp_congestion_control" = "bbr";
            "vm.swappiness" = 60;
            "vm.watermark_boost_factor" = 0;
            "vm.watermark_scale_factor" = 125;
            "vm.page-cluster" = 0;
            "kernel.printk" = "0 0 0 0";
        };
    };
}

