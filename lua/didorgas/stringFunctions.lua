local M = {}

-- TODO: make them work in visual mode

-- TODO: Use recursion to change indentation [2 to 5 and 4 to 2 and fix odd indentation]

-- Removes trailing and suppress errors
function M.removeTrailing()
    local ok, _ = pcall(vim.cmd, [[ execute '%s/\s\+$' ]])
    if ok then
        print "Didorgas Said: Removed trailing white spaces"
    end
end

-- Captures all indentation and doubles it
function M.indent2to4()
    local ok, _ = pcall(vim.cmd, [[ execute '%s/^\(\s*\)/\1\1' ]])
    if ok then
        print "Didorgas Said: Changing indent 2 to 4 spaces"
    end
end

-- Indent 4 to 2 spaces
-- Loop i 1..10 calling "%s/^\s\{N\}/  /g where N = i * 4
-- Break loop when pattern not found

return M
