#!/usr/bin/env bash

module_name=$1

# if module name is not provided, just run "sbt test"
# if module name is provided, then the actual module name is xpu.core.(MODULE_NAME)Test
if [ -z "$module_name" ]; then
    sbt test
else
    sbt "testOnly xpu.core.${module_name}Test"
fi
