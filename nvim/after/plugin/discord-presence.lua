-- MAIN IPC PIPE
local vimcord = require('cord')

vimcord.setup({
    -- your configuration options go here
    enabled = true,
    log_level = vim.log.levels.OFF,
    editor = {
        client = 'neovim',
            tooltip = function(opts) return 'The One True Text Editor\n(Line: ' .. opts.cursor_line .. ' out of ' .. vim.api.nvim_buf_line_count(0) .. ')' end,
        icon = nil,
    },
    display = {
        theme = 'atom',
        flavor = 'accent',
        swap_fields = false,
        swap_icons = true,
    },
    timestamp = {
        enabled = true,
        reset_on_idle = true,
        reset_on_change = true,
    },
    idle = {
        enabled = true,
        timeout = 60000,
        show_status = true,
        ignore_focus = true,
        unidle_on_focus = true,
        smart_idle = true,
        details = 'Idling it up',
        state = nil,
        tooltip = 'Probably meowing at a tree...',
        icon = nil,
    },
    text = {
        default = nil,
        workspace = function(opts) return 'In ' .. opts.workspace end,
        viewing = function(opts) return 'Viewing ' .. opts.filename end,
        editing = function(opts) return 'Editing ' .. opts.filename end,
        file_browser = function(opts) return 'Browsing files in ' .. opts.name end,
        plugin_manager = function(opts) return 'Managing plugins in ' .. opts.name end,
        lsp = function(opts) return 'Configuring LSP in ' .. opts.name end,
        docs = function(opts) return 'Reading ' .. opts.name end,
        vcs = function(opts) return 'Committing changes in ' .. opts.name end,
        notes = function(opts) return 'Taking notes in ' .. opts.name end,
        debug = function(opts) return 'Debugging in ' .. opts.name end,
        test = function(opts) return 'Testing in ' .. opts.name end,
        diagnostics = function(opts) return 'Fixing problems in ' .. opts.name end,
        games = function(opts) return 'Playing ' .. opts.name end,
        terminal = function(opts) return 'Running commands in ' .. opts.name end,
        dashboard = 'Home',
    }, 
    -- buttons = nil,
    buttons = {
        {
            label = 'View Repository',
            url = function(opts) return opts.repo_url end,
        },
    },
    assets = nil,
    variables = nil,
    hooks = {
        ready = nil,
        shutdown = nil,
        pre_activity = nil,
        post_activity = nil,
        idle_enter = nil,
        idle_leave = nil,
        workspace_change = nil,
    },
    plugins = nil,
    advanced = {
        plugin = {
            autocmds = true,
            cursor_update = 'on_hold',
            match_in_mappings = true,
        },
        server = {
            update = 'fetch',
            pipe_path =  nil,
            executable_path = nil,
            timeout = 300000,
        },
        discord = {
            reconnect = {
                enabled = false,
                interval = 5000,
                initial = true,
            },
        },
        workspace = {
            root_markers = {
                '.git',
                '.hg',
                '.svn',
            },
            limit_to_cwd = false,
        },
    },

})

-- SECOND IPC PIPE

require("presence").setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = true,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})
