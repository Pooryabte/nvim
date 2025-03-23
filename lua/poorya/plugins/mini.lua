return {
	{ 'echasnovski/mini.nvim', version = false ,
	config = function()
		local stline=require("mini.statusline")
		stline.setup {
			content = {
    				active = nil,
    				inactive = nil,
  			},
  			use_icons = true,
  			set_vim_settings = true,
		}
	end
}}
