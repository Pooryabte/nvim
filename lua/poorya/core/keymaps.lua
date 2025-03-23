vim.keymap.set('n','<space>ho',':help option-list<CR>',{desc='show list of vim options with short description!'})
vim.keymap.set('n','<space>x',':w<CR>:source %<CR>',{desc='save and execute this file!'})


-- managing splits

vim.keymap.set('n','<space>sn',':split<CR>',{desc='new horizontal split'})
vim.keymap.set('n','<space>sv',':vsplit<CR>',{desc='new vertical split'})
vim.keymap.set('n','<space>sh','<C-w>h',{desc='move to left split'})
vim.keymap.set('n','<space>sj','<C-w>j',{desc='move to below split'})
vim.keymap.set('n','<space>sk','<C-w>k',{desc='move to above split'})
vim.keymap.set('n','<space>sl','<C-w>l',{desc='move to right split'})
vim.keymap.set('n','<space>so','<C-w>o',{desc='close all other splits'})
vim.keymap.set('n','<space>sq','<C-w>q',{desc='close an quit split'})

--manging tabs
vim.keymap.set('n','<space>tt',':tabnew<CR>',{desc='create new tab'})
vim.keymap.set('n','<space>tn',':tabn<CR>',{desc='goto next tab'})
vim.keymap.set('n','<space>tp',':tabp<CR>',{desc='goto previous tab'})
vim.keymap.set('n','<space>tx',':tabclose<CR>',{desc='close this tab'})
vim.keymap.set('n','<space>to',':tabonly<CR>',{desc='close all other tabs'})

--create terminal in an split below this one
--

vim.keymap.set('n','<space>z',function() 
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd('J')
  vim.opt.number=false
  vim.opt.relativenumber=false
  vim.api.nvim_win_set_height(0,10)
end,{desc='close all other tabs'})

--vim.keymap.set('n','<space>ee',':Neotree<CR>',{desc='save and execute this file!'})
--vim.keymap.set('n','<space>ex',':w< sR>:source %<CR>',{desc='save and execute this file!'})
