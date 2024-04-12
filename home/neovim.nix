{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals.mapleader = " ";
    colorschemes.onedark.enable = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
    keymaps = [
    {
      key = "<C-h>";
      action = "<C-w>h";
    }
    {
      key = "<C-j>";
      action = "<C-w>j";
    }
    {
      key = "<C-k>";
      action = "<C-w>k";
    }
    {
      key = "<C-l>";
      action = "<C-w>l";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<CR>";
    }
    ];
    plugins = {
      lualine.enable = true;
      neo-tree.enable = true;
      treesitter.enable = true;
      ts-autotag.enable = true;
      ts-context-commentstring.enable = true;
      which-key.enable = true;
      luasnip.enable = true;
      lsp = {
	servers = {
	  nixd.enable = true;
	};
      };
      cmp = {
	enable = true;
	autoEnableSources = true;
	settings.completion.completeopt = "menu,menuone,oninsert";
	extraOptions = {
	  sources = [
	  {name = "path";}
	  {name = "nvim_lsp";}
	  {name = "buffer";}
	  {name = "luasnip";}
	  ];
	  mapping = {
	    "<C-n>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })";
	    "<C-p>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })";
	    "<C-b>" = "cmp.mapping.scroll_docs(-4)";
	    "<C-f>" = "cmp.mapping.scroll_docs(4)";
	    "<C-Space>" = "cmp.mapping.complete()";
	    "<C-e>" = "cmp.mapping.abort()";
	    "<Tab>" = "cmp.mapping.confirm({ select = true })";
	    "<S-Tab>" = "cmp.mapping.confirm({
	      behavior = cmp.ConfirmBehavior.Replace,
		       select = true,
	    })" ;
	    "<C-CR>" = "function(fallback)
	      cmp.abort()
	      fallback()
	      end";
	  };
	};
      };
      mini = {
	enable = true;
	modules = {
	  surround = {};
	  comment = {
	    options = {
	      custom_commentstring = {
		__raw = ''
		function()
		return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
		end
		'';
	      };
	    };
	  };
	  pairs = {};
	};
      };
    };
  };
}