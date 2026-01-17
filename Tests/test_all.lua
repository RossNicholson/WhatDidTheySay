#!/usr/bin/env lua5.1
-- Comprehensive test runner - runs all test suites and generates report

local function runTest(testFile)
    local handle = io.popen("./lua5.1 " .. testFile .. " 2>&1")
    if not handle then
        return nil, "Failed to run test"
    end
    local output = handle:read("*all")
    handle:close()
    
    -- Extract results
    local passed, lowConf, failed, coverage
    for line in output:gmatch("[^\n]+") do
        if line:match("Results:") then
            passed, lowConf, failed = line:match("Results: (%d+) passed, (%d+) low confidence, (%d+) failed")
        elseif line:match("Overall vocabulary coverage:") then
            coverage = line:match("Overall vocabulary coverage: ([%d%.]+)%%")
        end
    end
    
    return {
        passed = tonumber(passed) or 0,
        lowConf = tonumber(lowConf) or 0,
        failed = tonumber(failed) or 0,
        coverage = tonumber(coverage) or 0,
        output = output
    }
end

print("=" .. string.rep("=", 80))
print("COMPREHENSIVE TEST SUITE - ALL RESULTS")
print("=" .. string.rep("=", 80))
print()

local testSuites = {
    {name = "Comprehensive", file = "Tests/test_comprehensive.lua"},
    {name = "Real-World", file = "Tests/test_realworld.lua"},
    {name = "Extensive", file = "Tests/test_extensive.lua"},
    {name = "Chat Log", file = "Tests/test_log_messages.lua"},
}

local totalPassed = 0
local totalLowConf = 0
local totalFailed = 0
local totalTests = 0
local totalCoverage = 0
local coverageCount = 0

for _, suite in ipairs(testSuites) do
    print(string.format("\n=== %s Test Suite ===", suite.name))
    local results = runTest(suite.file)
    
    if results then
        totalPassed = totalPassed + results.passed
        totalLowConf = totalLowConf + results.lowConf
        totalFailed = totalFailed + results.failed
        totalTests = totalTests + results.passed + results.lowConf + results.failed
        
        if results.coverage > 0 then
            totalCoverage = totalCoverage + results.coverage
            coverageCount = coverageCount + 1
        end
        
        print(string.format("  Passed: %d", results.passed))
        print(string.format("  Low Confidence: %d", results.lowConf))
        print(string.format("  Failed: %d", results.failed))
        if results.coverage > 0 then
            print(string.format("  Coverage: %.1f%%", results.coverage))
        end
        print(string.format("  Total: %d tests", results.passed + results.lowConf + results.failed))
    else
        print("  ERROR: Could not run test suite")
    end
end

print("\n" .. string.rep("=", 80))
print("OVERALL SUMMARY")
print(string.rep("=", 80))
print(string.format("Total Tests: %d", totalTests))
print(string.format("  ✓ Passed: %d (%.1f%%)", totalPassed, totalTests > 0 and (totalPassed/totalTests)*100 or 0))
print(string.format("  ⚠ Low Confidence: %d (%.1f%%)", totalLowConf, totalTests > 0 and (totalLowConf/totalTests)*100 or 0))
print(string.format("  ✗ Failed: %d (%.1f%%)", totalFailed, totalTests > 0 and (totalFailed/totalTests)*100 or 0))
if coverageCount > 0 then
    print(string.format("Average Coverage: %.1f%%", totalCoverage / coverageCount))
end
print(string.rep("=", 80))

-- Calculate quality metrics
local successRate = totalTests > 0 and ((totalPassed + totalLowConf) / totalTests) * 100 or 0
local autoDisplayRate = totalTests > 0 and (totalPassed / totalTests) * 100 or 0

print(string.format("\nQuality Metrics:"))
print(string.format("  Success Rate (pass + low conf): %.1f%%", successRate))
print(string.format("  Auto-Display Rate (high conf): %.1f%%", autoDisplayRate))
print(string.format("  Failure Rate: %.1f%%", totalTests > 0 and (totalFailed/totalTests)*100 or 0))

if successRate >= 80 and autoDisplayRate >= 50 then
    print("\n✓ EXCELLENT - Addon is performing well!")
elseif successRate >= 70 and autoDisplayRate >= 40 then
    print("\n✓ GOOD - Addon is performing well with room for improvement")
elseif successRate >= 60 then
    print("\n⚠ FAIR - Addon needs more work")
else
    print("\n✗ NEEDS IMPROVEMENT - Significant issues remain")
end
