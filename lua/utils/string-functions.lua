local M = {}

-- Removes trailing and suppress errors
function M.remove_trailing()
    local ok, _ = pcall(vim.cmd, [[ execute '%s/\s\+$' ]])
    if ok then
        print "Removed trailing white spaces"
    else
        print "No trailing white spaces to remove"
    end
end

return M
