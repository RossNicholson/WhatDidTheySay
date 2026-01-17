# Test Suite

This directory contains all test scripts for the WhatDidTheySay addon.

## Running Tests

### Prerequisites
- Lua 5.1 interpreter (`lua5.1`) in the addon root directory
- Tests should be run from the addon root directory (not from the Tests directory)

### Quick Test
Test a single message:
```bash
cd /path/to/WhatDidTheySay
./lua5.1 Tests/test_simple.lua "Du suchst eine aktive, deutsche Gilde?"
```

### Run All Test Suites
```bash
cd /path/to/WhatDidTheySay
./lua5.1 Tests/test_all.lua
```

### Individual Test Files
```bash
cd /path/to/WhatDidTheySay
./lua5.1 Tests/test_comprehensive.lua
./lua5.1 Tests/test_extensive.lua
./lua5.1 Tests/test_realworld.lua
```

## Test Files

- **test_simple.lua** - Simple single-message test with detailed output
- **test_comprehensive.lua** - Comprehensive test suite with real-world scenarios
- **test_extensive.lua** - Extended test suite with more edge cases
- **test_realworld.lua** - Real-world chat message examples
- **test_all.lua** - Test runner that executes all test suites
- **test_german_training_data.lua** - Training data from German guild chat
- **test_*.lua** - Various specialized test files for specific scenarios

## Test Data Files

- **test_results.txt** - Historical test results
- **test_messages.txt** - Collection of test messages

## Note

All test files use relative paths (`Core/`, `Languages/`) to reference addon code.
**Important:** Tests must be run from the addon root directory (not from the Tests directory).
