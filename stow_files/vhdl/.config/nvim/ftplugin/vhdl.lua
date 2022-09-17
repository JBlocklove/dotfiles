vim.g.vhdl_indent_genportmap = 0
vim.g.HDL_Clock_Period = 10
vim.g.HDL_Author = "system('git config --global user.name')"

--local keys = {
--	{"n", "<leader>vc", "<Plug>SpecialVHDLPasteComponent"},
--	{"n", "<leader>vi", "<Plug>SpecialVHDLPasteInstance"},
--	{"n", "<leader>ve", "<Plug>SpecialVHDLPasteEntity"},
--	{"n", "<leader>vy", "<Plug>SpecialVHDLAction"},
--}
--
--require("mappings").map_key_list(keys)

vim.cmd("iabbrev <buffer> dt downto")
vim.cmd("iabbrev <buffer> sig signal")
vim.cmd("iabbrev <buffer> gen generate")
vim.cmd("iabbrev <buffer> ot others")
vim.cmd("iabbrev <buffer> sl std_logic")
vim.cmd("iabbrev <buffer> slv std_logic_vector")
vim.cmd("iabbrev <buffer> uns unsigned")
vim.cmd("iabbrev <buffer> toi to_integer")
vim.cmd("iabbrev <buffer> tos to_signed")
vim.cmd("iabbrev <buffer> tou to_unsigned")
