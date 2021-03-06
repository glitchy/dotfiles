vim.cmd("packadd nvim-treesitter")

local treesitter = {configs = require "nvim-treesitter.configs"}

function treesitter.init()
    treesitter.configs.setup({
        highlight = {
            enable = true -- false will disable the whole extension
        },
        incremental_selection = {
            enable = true,
            disable = {"cpp", "lua"},
            keymaps = { -- mappings for incremental selection (visual mappings)
                init_selection = "gnn", -- maps in normal mode to init the node/scope selection
                node_incremental = "grn", -- increment to the upper named parent
                scope_incremental = "grc", -- increment to the upper scope (as defined in locals.scm)
                node_decremental = "grm" -- decrement to th previous node
            }
        },
        refactor = {
            highlight_definitions = {enable = true},
            smart_rename = {
                enable = true,
                keymaps = {
                    smart_rename = "grr" -- mapping to rename reference under cursor
                }
            },
            navigation = {
                enable = true,
                keymaps = {
                    goto_definition = "gnd", -- mapping to go to definition of symbol under cursor
                    list_definitions = "gnD" -- mapping to list all definitions in current file
                }
            }
        }
    })
end

return treesitter
