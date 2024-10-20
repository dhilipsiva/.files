{ config, pkgs, ... }:

{

  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  system = {
    stateVersion = "24.05";
    autoUpgrade = {
      enable = true;
      allowReboot = true;
    };
  };

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  swapDevices = [];

  users = {
    mutableUsers = false;
    users.dhilipsiva = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" "networkmanager" ];
      hashedPassword = "$6$3TFqdE8hE9Hr9RS.$vd5EFAbzbHXn9qdQRRYtuwHyauBv/m1j.qe7LMo5tmz7KKhRZ1Fao8rS3BNPcS6f0yE4cOFHvf8ofcjzzkT671";
      shell = pkgs.fish;
      createHome = true;
    };
  };

  programs = {
    fish = {
      enable = true;
      interactiveShellInit = "eval $(starship init fish)";
    };
    sway = {
      enable = true;
    };
    gnupg.agent = {
      enable = true;
    };
    waybar = {
      enable = true;
    };
  };

  systemd = {
    timers."backup-nix-config" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "*-*-* *:*:00";  
        Persistent = true;              
      };
    };

    services."backup-nix-config" = {
      serviceConfig = {
        ExecStart = "/run/current-system/sw/bin/cp -r /etc/nixos/configuration.nix /home/dhilipsiva/.files/configuration.nix";
      };
    };
  };
  
  services = {
    syslogd.enable = true;
    cron = {
      enable = true;
      # logToSyslog = true;  # Enables logging to syslog
    };
    xserver = {
      enable = false;
    };
    displayManager = {
      enable = true;
      # defaultSession = "lightdm";
      sddm = {
        enable = true;
        wayland = {
          enable = true;
          # compositor = "sway";
        };
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    resolved = {
      enable = true;
    };
  };

  hardware = {
    pulseaudio.enable = false;
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings.enable = true;
      powerManagement.enable = true;
      prime.offload.enable = true;
    };
  };

  networking = {
    networkmanager.enable = true;
    hostName = "dhilipsiva-thinkpad";
  };

  fonts.packages = with pkgs; [
    fira-code
    font-awesome
    nerdfonts
  ];

  environment= {
    systemPackages = with pkgs; [
      alacritty
      atuin
      copilot-cli
      discord
      docker
      firefox
      fish
      fnm
      git
      gnupg
      google-chrome
      helix
      libinput
      microsoft-edge
      openssh
      python3
      ripgrep
      rofi-wayland
      rustup
      rye
      starship
      swayidle
      swaylock
      vscode
      waybar
      zellij 
    ];
    variables = {
      EDITOR = "hx";
      VISUAL = "hx";
      XDG_CONFIG_HOME = "/home/dhilipsiva/.files/.config";
    };
    shellAliases = {
      g = "git";
      e = "hx";
      q = "exit";
    };
  };

  virtualisation.docker = {
    enable = true;
  };
}

