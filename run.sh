#!/bin/bash
Testcase=$1
docker run --rm -v $(pwd)/testcase:/opt/jmeter/testcase --name jmeter xmlangel/jmeter ./jmeter -n -t ../testcase/$Testcse
