{
  inputs,
  cell,
}: {
  ja-jp-core = {pkgs, ...}: {
    time.timeZone = "Asia/Tokyo";

    i18n = {
      defaultLocale = "ja_JP.UTF-8";

      # https://nixos.wiki/wiki/Fcitx5
      inputMethod = {
        enabled = "fcitx5";
        fcitx5.addons = with pkgs; [
          fcitx5-mozc
          fcitx5-gtk
          fcitx5-lua
        ];
      };
    };
  };

  ja-jp-fonts = {pkgs, ...}: {
    fonts = {
      # https://nixos.wiki/wiki/Fonts

      enableDefaultFonts = true;
      fontDir.enable = true;
      fonts = with pkgs; [
        ipaexfont
        ipafont
        jetbrains-mono
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-emoji
        noto-fonts-extra
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
