{
  inputs,
  cell,
}: {
  ja-jp-core = {
    time.timeZone = "Asia/Tokyo";
    i18n.defaultLocale = "ja_JP.UTF-8";
  };

  ja-jp-input = {pkgs, ...}: {
    # https://wiki.nixos.org/wiki/Fcitx5
    i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.waylandFrontend = true;
      fcitx5.addons = with pkgs; [
        fcitx5-gtk
        fcitx5-mozc
      ];
    };
  };

  ja-jp-font = {pkgs, ...}: {
    # https://wiki.nixos.org/wiki/Fonts
    fonts = {
      fontDir.enable = true;
      packages = with pkgs; [
        ipaexfont
        ipafont
        jetbrains-mono
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
        noto-fonts-lgc-plus
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = ["IPAexMincho" "Noto Serif CJK JP" "Noto Serif"];
          sansSerif = ["IPAexGothic" "Noto Sans CJK JP" "Noto Sans"];
          monospace = ["JetBrains Mono"];
          emoji = ["Noto Color Emoji"];
        };
      };
    };
  };
}
