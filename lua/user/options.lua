local options = {

  -- number
  number = true,
  relativenumber = true,

  -- tab
  tabstop = 2,
  showtabline = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,

  -- cursorline
  cursorline = true, 

  -- search
  hlsearch = true,
  smartcase = true,
  ignorecase = true,

  -- scrolloff
  scrolloff = 8,
  sidescrolloff = 8,

  -- mouse
  mouse = 'a',

  -- split
  splitbelow = true,
  splitright = true,

  -- cmdheight
  cmdheight = 1,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
