local util = {}

function util.keyToDir(key)
    assert(key == "w" or key == "s", "why are you reading this key")
    if key == "w" then
        return -1
    elseif key == "s" then
        return 1
    end
end

function util.isValidDir(key, index, table)
    if index + util.keyToDir(key) <= 0 then
        return false
    elseif index + util.keyToDir(key) > #table then
        return false
    end
    return true
end

return util