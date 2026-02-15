#!/usr/bin/env luajit

local CACHE_FILE = os.getenv("HOME") .. "/.tmux/.path-cache"

-- Check if file/directory exists (optimized)
local function exists(path)
    local f = io.open(path, "r")
    if f then
        f:close()
        return true
    end
    -- Try opening as directory by checking a dummy file inside
    f = io.open(path .. "/.", "r")
    if f then
        f:close()
        return true
    end
    return false
end

-- Read cache
local function read_cache()
    local f = io.open(CACHE_FILE, "r")
    if f then
        local line = f:read("*l")
        f:close()
        if line then
            local path, result = line:match("^(.-)%|(.*)$")
            if path and result then
                return path, result
            end
        end
    end
    return nil, nil
end

-- Write cache
local function write_cache(path, result)
    os.execute("mkdir -p " .. os.getenv("HOME") .. "/.tmux")
    local f = io.open(CACHE_FILE, "w")
    if f then
        f:write(path .. "|" .. result)
        f:close()
    end
end

-- Find anchor
local function find_anchor(path, markers)
    local current = path
    
    while current ~= "/" do
        for marker in markers:gmatch("%S+") do
            if exists(current .. "/" .. marker) then
                local name = current:match("([^/]+)$")
                return current, name
            end
        end
        local parent = current:match("^(.+)/[^/]+$")
        if not parent then break end
        current = parent
    end
    
    return nil, nil
end

-- Smart display
local function smart_display(path, markers)
    local home = os.getenv("HOME")
    local display_path = path:gsub("^" .. home, "~")
    
    local anchor_dir, anchor_name = find_anchor(path, markers)
    
    if anchor_name then
        local rel_path = path:sub(#anchor_dir + 1):gsub("^/", "")
        
        if rel_path == "" then
            return "[" .. anchor_name .. "]"
        else
            return "[" .. anchor_name .. "]/" .. rel_path
        end
    else
        -- Fallback
        local parts = {}
        for part in display_path:gmatch("[^/]+") do
            table.insert(parts, part)
        end
        
        if #parts <= 3 then
            return display_path
        else
            return "…/" .. parts[#parts-2] .. "/" .. parts[#parts-1] .. "/" .. parts[#parts]
        end
    end
end

-- Main
local function main()
    local style = os.getenv("TMUX_PATH_STYLE") or "smart"
    local markers = os.getenv("TMUX_PATH_MARKERS") or ".git .repo .hg"
    local current_path = arg[1]
    
    if not current_path then
        print("Error: path required")
        os.exit(1)
    end
    
    -- Check cache
    local cached_path, cached_result = read_cache()
    if cached_path == current_path and cached_result then
        print(cached_result)
        return
    end
    
    -- Calculate result
    local result
    if style == "basename" then
        result = current_path:match("([^/]+)$")
    elseif style == "full" then
        local home = os.getenv("HOME")
        result = current_path:gsub("^" .. home, "~")
    elseif style == "smart" then
        result = smart_display(current_path, markers)
    else
        result = current_path:match("([^/]+)$")
    end
    
    -- Write cache
    write_cache(current_path, result)
    print(result)
end

main()
