local fc = loadstring(game:HttpGet("https://raw.githubusercontent.com/LTRM1-1/function-library/main/SOURCE"))()

-- 1. Table Utilities Example
local inventory = {"sword", "shield", "potion", "arrow", "bow"}
print("Shuffled inventory:", table.concat(fc.shuffle(fc.deepcopy(inventory)), ", "))

local nestedTable = {1, {2, 3}, {4, {5, 6}}}
print("Flattened table:", table.concat(fc.flatten(nestedTable), ", "))

local chunked = fc.chunk(inventory, 2)
print("Chunked inventory:")
for i, group in ipairs(chunked) do
    print("Group "..i..": "..table.concat(group, ", "))
end

-- 2. String Utilities Example
local articleTitle = "  The Quick Brown Fox Jumps!  "
print("Slugified title:", fc.slugify(articleTitle))
print("Levenshtein distance:", fc.levenshtein("kitten", "sitting"))

local longText = "This is a very long sentence that needs to be wrapped properly for better readability."
print("Wrapped text:")
print(fc.wrapText(longText, 20))

-- 3. Math Utilities Example
print("Is 17 prime?", fc.isPrime(17))
print("Factorial of 5:", fc.factorial(5))

local stats = {5, 7, 3, 9, 2}
print("Standard deviation:", fc.standardDeviation(stats))

-- 4. Functional Programming Example
local expensiveCalc = fc.memoize(function(x)
    print("Performing heavy calculation...")
    return x * x * math.pi
end)

print("Memoized result (1st call):", expensiveCalc(5)) -- Prints message
print("Memoized result (2nd call):", expensiveCalc(5)) -- Uses cache

local processText = fc.compose(
    fc.trim,
    string.lower,
    function(s) return s:gsub("!", "") end
)
print("Processed text:", processText("  HELLO World!  "))

-- 5. Time Utilities Example
local stopwatch = fc.stopwatch()
task.wait(1.5)
print("Elapsed time:", stopwatch(), "seconds")

print("Formatted duration:", fc.formatDuration(3675)) -- 1 hour 1 minute 15 seconds

-- 6. Data Structures Example
local todoQueue = fc.queue()
todoQueue.enqueue("Buy milk")
todoQueue.enqueue("Clean room")
todoQueue.enqueue("Pay bills")

print("\nTodo list:")
while todoQueue.size() > 0 do
    print("- "..todoQueue.dequeue())
end

-- 7. Error Handling Example
local success, result = pcall(fc.factorial, -5)
print("\nFactorial error handling:", success, result)

-- 8. Advanced Utilities
local colorPalette = fc.colorGradient("#FF0000", "#0000FF", 5)
print("\nColor gradient:")
for _, hex in ipairs(colorPalette) do
    print(hex)
end

-- 9. Game Development Example
local hitbox1 = {x=0, y=0, width=10, height=10}
local hitbox2 = {x=8, y=8, width=10, height=10}
print("Collision detected:", fc.checkCollision(hitbox1, hitbox2))

-- 10. Network Utilities Example
local apiData = fc.httpGet("https://api.example.com/data")
if apiData then
    local parsed = fc.tryParseJSON(apiData)
    print("\nAPI response:", parsed and "Valid JSON" or "Invalid JSON")
end
