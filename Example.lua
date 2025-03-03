local fc = {}

-- Runs a function in a loop with delay
function fc.loop(func, times, delay)
    for i = 1, times do
        task.wait(delay or 0)
        func(i)
    end
end

-- Repeats a function every interval seconds indefinitely
function fc.repeatEvery(interval, func)
    task.spawn(function()
        while true do
            task.wait(interval)
            func()
        end
    end)
end

-- Runs a function asynchronously (non-blocking)
function fc.async(func, ...)
    task.spawn(func, ...)
end

-- Delays execution of a function
function fc.delay(time, func, ...)
    task.delay(time, func, ...)
end

-- Rounds a number to the nearest decimal places
function fc.round(num, places)
    local mult = 10^(places or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- Clamps a number within a range
function fc.clamp(num, min, max)
    return math.max(min, math.min(num, max))
end

-- Generates a random string of a given length
function fc.randomString(length)
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    local str = ""
    for i = 1, length do
        local rand = math.random(1, #chars)
        str = str .. string.sub(chars, rand, rand)
    end
    return str
end

-- Splits a string by a given separator
function fc.split(str, sep)
    local result = {}
    for match in (str .. sep):gmatch("(.-)" .. sep) do
        table.insert(result, match)
    end
    return result
end

-- Trims whitespace from both ends of a string
function fc.trim(str)
    return str:match("^%s*(.-)%s*$")
end

-- Merges multiple tables into one
function fc.mergeTables(...)
    local merged = {}
    for _, t in ipairs({...}) do
        for k, v in pairs(t) do
            merged[k] = v
        end
    end
    return merged
end

-- Checks if a table contains a value
function fc.contains(table, value)
    for _, v in pairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

-- Counts occurrences of a value in a table
function fc.countOccurrences(table, value)
    local count = 0
    for _, v in pairs(table) do
        if v == value then
            count = count + 1
        end
    end
    return count
end

-- Creates a deep copy of a table
function fc.deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[fc.deepcopy(orig_key)] = fc.deepcopy(orig_value)
        end
        setmetatable(copy, fc.deepcopy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end

-- Linear interpolation between two numbers
function fc.lerp(a, b, t)
    return a + (b - a) * t
end

-- Converts RGB to Hex color
function fc.rgbToHex(r, g, b)
    return string.format("#%02X%02X%02X", r, g, b)
end

-- Converts Hex to RGB color
function fc.hexToRGB(hex)
    hex = hex:gsub("#", "")
    return tonumber("0x" .. hex:sub(1, 2)) / 255, tonumber("0x" .. hex:sub(3, 4)) / 255, tonumber("0x" .. hex:sub(5, 6)) / 255
end

-- Waits until a condition is met
function fc.waitUntil(condition, timeout)
    local start = os.clock()
    while not condition() do
        task.wait()
        if timeout and os.clock() - start >= timeout then
            return false
        end
    end
    return true
end

return fc
