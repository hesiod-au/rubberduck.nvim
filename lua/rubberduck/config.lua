local M = {}
function M.defaults()
    local defaults = {
        srv_pipe_file = "/tmp/nvim_server.pipe",
        start_columns = 80,
        rd_file_path = os.getenv("HOME") .. "/.rubber_duck/rubber_duck.out"
    }
    return defaults
end

M.options = {}

function M.setup(options)
    options = options or {}
    M.options = vim.tbl_deep_extend("force", {}, M.defaults(), options)
end

return M
