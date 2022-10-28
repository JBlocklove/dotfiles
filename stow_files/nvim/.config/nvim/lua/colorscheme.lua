-- transparent window overrides
--cmd "au ColorScheme * hi Normal ctermbg=none guibg=none"
--cmd "au ColorScheme * hi SignColumn ctermbg=none guibg=none"
--cmd "au ColorScheme * hi NormalNC ctermbg=none guibg=none"
--cmd "au ColorScheme * hi MsgArea ctermbg=none guibg=none"
--cmd "au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none"
--cmd "let &fcs='eob: '"

vim.g.moonlight_disable_background = true
vim.g.moonlight_borders = true
require("moonlight").set()
