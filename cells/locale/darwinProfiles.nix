{
  inputs,
  cell,
}: {
  ja-jp-core = {
    time.timeZone = "Asia/Tokyo";
  };

  ja-jp-fonts = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      jetbrains-mono
    ];
  };
}
