#!/bin/bash
Testcase=$1
docker run --rm -v $(pwd)/testcase:/opt/jmeter/testcase --name jmeter xmlangel/jmeter:2.13 ./jmeter -n -t /opt/jmeter/testcase/$Testcase
