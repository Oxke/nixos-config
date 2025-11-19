{ pkgs, ... }:
{
  programs.nixvim = { 
    plugins = {
      vimtex.enable = true;
      lz-n.enable = true;
      lualine.enable = true;
      treesitter.enable = true;
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          ts_ls.enable = true;
          lua_ls.enable = true;
          ltex = {
            enable = true;
            settings.language = "it";
            settings.additionalLanguages = [ "en-US" "fr" ];
          };
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "ultisnips"; }
            { name = "luasnip"; }
            { name = "vimtex"; }
          ];
          mapping = { __raw = ''{
              ['<cr>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
              },

              ['<A-l>'] = function(fallback)
                -- UltiSnips: expand or jump forward if possible
                if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
                  return vim.fn["UltiSnips#ExpandSnippet"]()
                elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                  return vim.fn["UltiSnips#JumpForwards"]()
                end

                -- Otherwise confirm completion
                cmp.mapping.confirm {
                  behavior = cmp.ConfirmBehavior.Insert,
                  select = true,
                }(fallback)
              end,

              ['<Tab>'] = function(fallback)
                if not cmp.select_next_item() then
                  if vim.bo.buftype ~= 'prompt' and has_words_before() then
                    cmp.complete()
                  else
                    fallback()
                  end
                end
              end,

              ['<S-Tab>'] = function(fallback)
                if not cmp.select_prev_item() then
                  if vim.bo.buftype ~= 'prompt' and has_words_before() then
                    cmp.complete()
                  else
                    fallback()
                  end
                end
              end,
          }'';};
          snippet.expand = ''
            function(args)
              -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
              require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
              -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
              vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end
          '';
        };
      };
      luasnip.enable = true;
      friendly-snippets.enable = true;
      tiny-inline-diagnostic.enable = true;
      telescope = {
        enable = true;
        keymaps = {
          "<C-p>" = {
            action = "git_files";
            options = {
              desc = "Telescope Git Files";
            };
          };
          "<leader>fd" = {
            action = "live_grep";
            options = {
              desc = "Telescope Live Grep";
            };
          };
          "<leader>ff" = {
            action = "find_files";
            options = {
              desc = "Telescope Find Files";
            };
          };
          "<leader>fb" = {
            action = "buffers";
            options = {
              desc = "Telescope Find Buffers";
            };
          };
        };
      };
      web-devicons.enable = true;
      mini = {
        enable = true;
        modules = import ./mini-modules.nix;
      };
    };
    extraPlugins = let vp = pkgs.vimPlugins; in [
      vp.ultisnips
    ];
  };
}
