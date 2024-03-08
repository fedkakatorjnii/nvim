local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	print("Not found cmp!")
	return
end

local cmp_buffer_status, cmp_buffer = pcall(require, "cmp_buffer")
if not cmp_buffer_status then
	print("Not found cmp_buffer!")
	return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	print("Not found luasnip!")
	return
end

local lspkind = require("lspkind")
-- luasnip setup
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-a>"] = cmp.mapping.complete(),
		["<C-Space>"] = cmp.mapping.complete(),

		["<C-Tab>"] = cmp.mapping.complete(),
		-- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete({
		--   reason = cmp.ContextReason.Auto,
		-- }), { 'i', 'c' }),
		-- ['<M-Space>'] = cmp.mapping(cmp.mapping.complete({
		--   reason = cmp.ContextReason.Manual,
		-- }), { 'i', 'c' }),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{
			name = "buffer",
			option = {
				keyword_length = 0,
			},
		},
	}),
	formatting = {
		format = lspkind.cmp_format({
			with_text = false,
			maxwidth = 50,
		}),
	},
	-- sorting = {
	--   comparators = {
	--     function(...) return cmp_buffer:compare_locality(...) end,
	--     -- The rest of your comparators...
	--   }
	-- }
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])

-- " Use <Tab> and <S-Tab> to navigate through popup menu
-- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
