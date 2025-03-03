local fc = loadstring(game:HttpGet("https://raw.githubusercontent.com/LTRM1-1/function-library/main/SOURCE"))()

-- Example Usage:

fc.loop(function(i)
    print("Loop iteration:", i)
end, 5, 1)  -- Runs 5 times with 1-second delay

fc.repeatEvery(0.5, function()
    print("Repeating every 0.5 seconds")
end)

fc.async(function()
    print("This runs asynchronously!")
end)

fc.delay(3, function()
    print("This runs after 3 seconds")
end)

print(fc.round(3.14159, 2))  -- 3.14

print(fc.randomString(10))  -- Random 10-character string

print(fc.trim("  Hello World  "))  -- "Hello World"

print(fc.contains({1, 2, 3, 4}, 3))  -- true

print(fc.rgbToHex(255, 165, 0))  -- "#FFA500" (Orange)

