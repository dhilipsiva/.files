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
    extraModulePackages = [ config.boot.kernelPackages.bbswitch ];
  };

  swapDevices = [];

  users = {
    mutableUsers = false;
    users.dhilipsiva = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" "networkmanager" ];
      hashedPassword = "$6$3TFqdE8hE9Hr9RS.$vd5EFAbzbHXn9qdQRRYtuwHyauBv/m1j.qe7LMo5tmz7KKhRZ1Fao8rS3BNPcS6f0yE4cOFHvf8ofcjzzkT671";
      # shell = pkgs.fish;
      createHome = true;
    };
  };

  programs = {
    bash = {
      # enable = true;
      promptInit = "eval $(starship init bash)";
      interactiveShellInit = "eval $(atuin init bash)";
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    waybar = {
      enable = true;
    };
    hyprland = {
      enable = true;
    };
    hyprlock = {
      enable = true;
    };
  };

  systemd = {
    timers."backup-nix-config" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "*-*-* *:00:00";
        Persistent = true;
      };
    };

    services."backup-nix-config" = {
      serviceConfig = {
        ExecStart = "/run/current-system/sw/bin/cp -r /etc/nixos/configuration.nix /home/dhilipsiva/.files/configuration.nix";
      };
    };
  };
  
  time.timeZone = "Asia/Kolkata";

  services = {
    syslogd.enable = true;
    timesyncd.enable = true;
    cron = {
      enable = true;
    };
    xserver = {
      enable = false;
    };

    gnome.gnome-keyring = {
      enable = true;
    };
    hypridle = {
      enable = true;
    };
    displayManager = {
      enable = false;
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
    nvidiaOptimus = {
      disable = true;
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
      awscli2
      bottom
      copilot-cli
      discord
      docker
      firefox
      fish
      gcc
      git
      gnome.gnome-keyring
      gnome.seahorse
      gnumake
      gnupg
      google-chrome
      helix
      infisical
      lemurs
      libinput
      microsoft-edge
      nodejs_20
      nodePackages.aws-cdk
      openconnect
      openssh
      python3
      ripgrep
      rofi-wayland
      rustup
      rye
      starship
      # steam
      taskwarrior3
      vscode
      watchman
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
    enableOnBoot = false;
  };
}
