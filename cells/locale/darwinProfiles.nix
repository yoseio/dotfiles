{
  inputs,
  cell,
}: {
  ja-jp-core = {
    time.timeZone = "Asia/Tokyo";
  };

  ja-jp-fonts = {pkgs, ...}: {
    fonts = {
      fontDir.enable = true;
      fonts = with pkgs; [
        jetbrains-mono
      ];
    };
  };
}
