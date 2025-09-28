{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      vscodevim.vim
      yzhang.markdown-all-in-one

      github.copilot
      github.copilot-chat

      ms-python.python
      ms-python.vscode-pylance
      
      julialang.language-julia

      ms-vscode.cpptools
    ];
  };
}
