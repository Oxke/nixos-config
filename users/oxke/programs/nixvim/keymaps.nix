[
  # --- Move around ---
  {
    mode = "n";
    key = " ";
    action = "<C-w>";
    options.desc = "easier move-around with space";
  }

  {
    mode = "n";
    key = "<C-w>";
    action = ":res +3<CR>";
    options.desc = "window resizing";
  }
 {
    mode = "n";
    key = "<C-a>";
    action = ":vert res -3<CR>";
    options.desc = "window resizing";
  }
  {
    mode = "n";
    key = "<C-s>";
    action = ":res -3<CR>";
    options.desc = "window resizing";
  }
  {
    mode = "n";
    key = "<C-d>";
    action = ":vert res +3<CR>";
    options.desc = "window resizing";
  }

  {
    mode = "n";
    key = "<CR>";
    action = "O<Esc>j";
    options.desc = "new line";
  }
  {
    mode = "";
    key = "<leader><CR>";
    action = ":noh<CR>";
    options.desc = "disable highlight";
  }

  # --- Buffers ---
  {
    mode = "n";
    key = "<leader>bd";
    action = ":Bclose<CR>";
    options.desc = "close current buffer";
  }
  {
    mode = "n";
    key = "<leader>ba";
    action = ":bufdo bd<CR>";
    options.desc = "close all buffers";
  }
  {
    mode = "";
    key = "<leader>;";
    action = ":b#<CR>";
    options.desc = "move to last buffer";
  }
  {
    mode = "";
    key = "<leader>l";
    action = ":bnext<CR>";
    options.desc = "next buffer";
  }
  {
    mode = "";
    key = "<leader>h";
    action = ":bprevious<CR>";
    options.desc = "prev buffer";
  }
  {
    mode = "";
    key = "<leader>n";
    action = ":enew<CR>";
    options.desc = "new buffer";
  }

  # --- Tabs ---
  {
    mode = "n";
    key = "<leader>tn";
    action = ":tabnew<CR>";
    options.desc = "new tab";
  }
  {
    mode = "n";
    key = "<leader>tv";
    action = ":e ~/.config/nvim/lua<CR>";
    options.desc = "open settings";
  }
  {
    mode = "n";
    key = "<leader>to";
    action = ":tabonly<CR>";
    options.desc = "keep only current tab";
  }
  {
    mode = "n";
    key = "<leader>tc";
    action = ":tabclose<CR>";
    options.desc = "close current tab";
  }
  {
    mode = "n";
    key = "<leader>tm";
    action = ":tabmove<CR>";
    options.desc = "move tab";
  }

  # cannot reference vim.g.lasttab, so skip that one
  {
    mode = "n";
    key = "<leader>te";
    action = ":e <C-r>=expand('%:p:h')<CR><CR>";
    options.desc = "open new tab in current buffer path";
  }

  {
    mode = "n";
    key = "<leader>cd";
    action = ":cd %:p:h<CR>:pwd<CR>";
    options.desc = "change cwd to buffer dir";
  }

  # --- Editing ---
  {
    mode = "n";
    key = "<C-j>";
    action = "mz:m+<CR>`z";
  }
  {
    mode = "n";
    key = "<C-k>";
    action = "mz:m-2<CR>`z";
  }
  {
    mode = "v";
    key = "<C-j>";
    action = ":m'>+<CR>`<my`>mzgv`yo`z";
  }
  {
    mode = "v";
    key = "<C-k>";
    action = ":m'<-2<CR>`>my`<mzgv`yo`z";
  }

  {
    mode = "";
    key = "<leader>m";
    action = ":w<CR>";
    options.desc = "save current buffer";
  }
  {
    mode = "";
    key = "<leader>.";
    action = ":wa<CR>";
    options.desc = "save all buffers";
  }

  {
    mode = "n";
    key = "<leader>gg";
    action = "!git commit -a -m \"AutoCommit\" && git push<CR>";
    options.desc = "quick commit";
  }

  {
    mode = "n";
    key = "<leader>src";
    action = ":luafile $MYVIMRC<CR>";
    options.desc = "reload config";
  }

  # --- Spell ---
  {
    mode = "";
    key = "<leader>ss";
    action = ":setlocal spell!<CR>";
    options.desc = "toggle spell";
  }
  {
    mode = "";
    key = "<C-c>";
    action = "<Esc>[s1z=`]a";
    options.desc = "correct last typo";
  }

  # --- Misc ---
  {
    mode = "n";
    key = "<leader>pp";
    action = ":setlocal paste!<CR>";
    options.desc = "toggle paste";
  }

  # Theme switch
  {
    mode = "n";
    key = "<leader>bgd";
    action = ":set bg=dark<CR>";
  }
  {
    mode = "n";
    key = "<leader>bgl";
    action = ":set bg=light<CR>";
  }

  # lazyvim
  {
    mode = "n";
    key = "<C-l>";
    action = ":Lazy<CR>";
  }
  # vimtex
  {
    mode = "n";
    key = "<leader>vc";
    action = ":VimtexCompile<CR>";
  }
  {
    mode = "n";
    key = "<leader>vv";
    action = ":VimtexView<CR>";
  }
]

