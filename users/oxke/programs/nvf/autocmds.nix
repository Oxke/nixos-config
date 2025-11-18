[
  # --- FileTypes with 2-space indent ---
  {
    event = [ "FileType" ];
    pattern = [
      "markdown"
      "html"
      "typescript"
      "typescriptreact"
    ];
    command = "setlocal ts=2 sw=2 sts=2";
  }

  # --- gitcommit: wrap at 72 chars ---
  {
    event = [ "FileType" ];
    pattern = "gitcommit";
    command = "setlocal tw=72";
  }

  # --- Template auto-insert on new file ---
  {
    event = [ "BufNewFile" ];
    pattern = "*";
    callback = {__raw = ''
    function()
      vim.cmd("silent! 0r ~/.config/nvim/templates/template." .. vim.fn.expand("%:e"))
    end
    '';};
  }

  # --- Track last tab ---
  {
    event = [ "TabLeave" ];
    pattern = "*";
    command = "let g:lasttab = tabpagenr()";
  }

  # --- Restore cursor position after opening file ---
  {
    event = [ "BufReadPost" ];
    pattern = "*";
    callback = {__raw = ''
      function()
      if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
        vim.cmd("normal! g'\"")
      end
      end
    '';};
  }
]
