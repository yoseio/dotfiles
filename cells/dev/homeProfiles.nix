{
  inputs,
  cell,
}: {
  cli = {
    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.starship.enable
    programs.starship = {
      enable = true;
    };

    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.eza.enable
    programs.eza = {
      enable = true;
    };

    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.bat.enable
    programs.bat = {
      enable = true;
    };

    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.direnv.enable
    programs.direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };
  };

  zsh = {
    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      enableVteIntegration = true;
      dotDir = ".config/zsh";
    };
  };

  git = {pkgs, ...}: {
    programs.git = {
      enable = true;

      userName = "yoseio";
      userEmail = "98276492+yoseio@users.noreply.github.com";

      aliases = {
        # reset
        soft = "reset --soft";
        hard = "reset --hard";
        s1ft = "soft HEAD~1";
        h1rd = "hard HEAD~1";

        # log
        lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        plog = "log --graph --pretty='format:%C(red)%d%C(reset) %C(yellow)%h%C(reset) %ar %C(green)%aN%C(reset) %s'";
        tlog = "log --stat --since='1 Day Ago' --graph --pretty=oneline --abbrev-commit --date=relative";
        rank = "shortlog -sn --no-merges";
      };

      ignores = [
        # Created by https://www.toptal.com/developers/gitignore/api/linux,visualstudiocode
        # Edit at https://www.toptal.com/developers/gitignore?templates=linux,visualstudiocode

        ### Linux ###
        "*~"

        # temporary files which can be created if a process still has a handle open of a deleted file
        ".fuse_hidden*"

        # KDE directory preferences
        ".directory"

        # Linux trash folder which might appear on any partition or disk
        ".Trash-*"

        # .nfs files are created when an open file is removed but is still being accessed
        ".nfs*"

        ### VisualStudioCode ###
        ".vscode/*"
        "!.vscode/settings.json"
        "!.vscode/tasks.json"
        "!.vscode/launch.json"
        "!.vscode/extensions.json"
        "!.vscode/*.code-snippets"

        # Local History for Visual Studio Code
        ".history/"

        # Built Visual Studio Code Extensions
        "*.vsix"

        ### VisualStudioCode Patch ###
        # Ignore all local history of files
        ".history"
        ".ionide"

        # End of https://www.toptal.com/developers/gitignore/api/linux,visualstudiocode
      ];
    };

    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.gh.enable
    # https://github.com/nix-community/home-manager/issues/3401
    #programs.gh = {
    #  enable = true;
    #};
    home.packages = with pkgs; [
      gh
    ];
  };

  gui = {
    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.alacritty.enable
    programs.alacritty = {
      enable = true;
    };

    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.vscode.enable
    programs.vscode = {
      enable = true;
    };
  };

  arduino = {pkgs, ...}: {
    home.packages = with pkgs; [
      arduino
      arduino-cli
    ];
  };

  ctf = {pkgs, ...}: {
    home.packages = with pkgs; [
      # TODO: burpsuite
      # TODO: ghidra
      inputs.pwndbg
    ];
  };

  chromium = {pkgs, ...}: {
    home.sessionPath = [
      "$HOME/Workspace/depot_tools"
    ];
  };
}
