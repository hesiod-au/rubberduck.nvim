--print("hello world")
local Config = require("rubberduck.config")

local M = {}

M.setup = function(options)
    Config.setup(options)
end

M.openRdSidebar = function()
    vim.cmd('vsplit')
    vim.cmd('wincmd l')
    vim.cmd('edit ' .. Config.options.rd_file_path)
    vim.cmd('vertical resize ' .. Config.options.start_columns)
    vim.wo.wrap = true
    local buffer_number = vim.api.nvim_get_current_buf()
    local window_number = vim.fn.bufwinid(buffer_number)
    _G.rd_buffer_number = buffer_number
    _G.rd_window_number = window_number
    local fwatch = require('fwatch')
    vim.cmd('wincmd h')
    vim.cmd('call serverstart("' .. Config.options.srv_pipe_file .. '")')
    fwatch.watch(Config.options.rd_file_path, {
        on_event = function()
            vim.defer_fn(function()
                local last_line = vim.api.nvim_buf_line_count(_G.rd_buffer_number)
                vim.api.nvim_win_set_cursor(_G.rd_window_number, {last_line, 0})
            end, 500)
        end
    })
end

return M
