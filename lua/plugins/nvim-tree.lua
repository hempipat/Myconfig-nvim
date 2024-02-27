return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
            disable_netrw = true,
            hijack_netrw = true,
            filters = {
                dotfiles = false,
            },
            view = {
                adaptive_size = true,
                float = {
                    enable = true,
                },
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                }
            }
        })
    end,
}
