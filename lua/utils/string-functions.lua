local M = {}

-- TODO: make them work in visual mode

-- TODO: Use recursion to change indentation
-- Indent 4 to 2 spaces
-- Loop i 1..10 calling "%s/^\s\{N\}/  /g where N = i * 4
-- Break loop when pattern not found

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
