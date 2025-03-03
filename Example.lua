local fc = loadstring(game:HttpGet("https://raw.githubusercontent.com/LTRM1-1/function-library/main/SOURCE"))()

fc.loop(function(i)
    print("Loop iteration:", i)
end, 5, 1)  

fc.repeatEvery(0.5, function()
    print("Repeating every 0.5 seconds")
end)

fc.async(function()
    print("This runs asynchronously!")
end)

fc.delay(3, function()
    print("This runs after 3 seconds")
end)

print(fc.round(3.14159, 2))  

print(fc.randomString(10))  

print(fc.trim("  Hello World  "))  

print(fc.contains({1, 2, 3, 4}, 3))  

print(fc.rgbToHex(255, 165, 0))  
