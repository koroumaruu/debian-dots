  { config, pkgs, ... }:
 
  {
    imports =
      [ 
        ./hardware-configuration.nix
      ];
  
    environment.systemPackages = with pkgs; [
    neovim
    xarchiver
    wget
    prismlauncher
    gparted 
    mangowc
    bottom
    curl
    lavat
    bzip2
    cava
    tty-clock
    cmatrix
    calc
    openssl
    yazi
    mov-cli
    gh
    zbar
    alacritty
    vesktop
    kew
    yt-dlp
    ufetch
    tree
    spotify
    ranger 
    s-tui
    mako
    swaybg
    networkmanagerapplet
    pfetch
    microfetch
    lsd
    pavucontrol
    waybar
    bluez
    blueman
    nwg-look
    sway-contrib.grimshot 
    wl-clipboard
    obsidian
    hyprpicker
    waypaper
    gcc
    foot
    rofi
    kitty 
    fzf
    mpv 
    git
    qutebrowser
    htop
    btop
    freetube 
    picom
    #theming
    arc-theme
    matcha-gtk-theme
    ];

    fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    tamzen
    cozette
    spleen
    fixedsys-excelsior 
    scientifica
    sarasa-gothic
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    ];
  
    nixpkgs.config.allowUnfree = true;
    programs.firefox.enable = true;
    services.flatpak.enable = true;
    services.tailscale.enable = true;
    programs.appimage.enable = true;
    programs.appimage.binfmt = true;
    services.openssh.enable = true;
    programs.sway.enable = true;
    hardware.bluetooth.enable = true;
  
    # steam 
    programs.steam.enable = true;
    programs.gamemode.enable = true;

    services.displayManager= {
	ly.enable = true;
    };

    services.xserver = {
	enable = true;
	autoRepeatDelay = 200;
	autoRepeatInterval = 35;
    };

    #thunar/mounts
    services.gvfs.enable = true; #mount, trash, etc
    programs.thunar.enable = true;
    services.tumbler.enable = true; #thumbnails
    programs.xfconf.enable = true; # saves preferences apparently idk but i dont wanna remove it 
  
    programs.thunar.plugins = with pkgs.xfce; [
    thunar-volman
    thunar-archive-plugin
    ];
  
    #power management 
    services.tlp = {
	enable = true;
	settings = {
	    CPU_SCALING_GOVERNOR_ON_AC = "performance";
	    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

            CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
            CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

            CPU_MIN_PERF_ON_AC = 0;
            CPU_MAX_PERF_ON_AC = 100;
            CPU_MIN_PERF_ON_BAT = 0;
            CPU_MAX_PERF_ON_BAT = 60;
	};
    };

    services.thinkfan = {
	enable = true;
	settings = {
	    fan_speed = "level auto";
	    sensors = [
		{ name = "cpu"; hwmon = "/sys/class/hwmon/hwmon0/temp1_input"; }
	    ];
	    levels = [
              [0 0 55]    # Fan off below 55°
              [1 50 60]   # Low speed 50-60°C
              [3 55 65]   # Medium speed
              [7 60 85]   # Max speed
	    ];
	};
    };
    
    #garbage collect
    #for manual run "sudo nix-collect-garbage -d" or "nix-collect-garbage --delete-older-than <NUMBER>d
    boot.loader.systemd-boot.configurationLimit = 10;  
    nix.gc = {
	automatic = true;
	dates = "weekly";
	options = "--delete-older-than 7d";
    };

    #nix-helper
    programs.nh.enable = true;
  
    users.users.korou = {
      isNormalUser = true;
      description = "korou";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };

    nix.settings.download-buffer-size = 524288000; # 500 MiB
    services.xserver.videoDrivers = ["amdgpu"];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_zen;
    networking.hostName = "deimos"; # Hostname
    networking.networkmanager.enable = true;
    time.timeZone = "America/New_York";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    services.xserver.xkb = {
      layout = "us";
    };
    
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "25.11"; # Did you read the comment?
  
}
