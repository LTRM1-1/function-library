local CustomLib = require(game.ReplicatedStorage.CustomLib) --roblox property

-- Example usage of loop()
CustomLib.loop(function(i)
    print("Loop iteration:", i)
end, 5, 1) -- Runs 5 times with a 1-second delay

-- Example usage of repeatEvery()
CustomLib.repeatEvery(0.2, function()
    print("Repeating every 0.2 seconds")
end)
