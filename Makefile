all: test

test: clean
	@mkdir -p tmp
	@PYTHONPATH=tmp python setup.py develop -d tmp
	@# run all tests
	@PYTHONPATH=tmp python ua_parser/user_agent_parser_test.py
	@# run a single test
	@#PYTHONPATH=tmp python ua_parser/user_agent_parser_test.py ParseTest.testStringsDeviceBrandModel

clean:
	@find . -name '*.pyc' -delete
	@rm -rf tmp \
	   ua_parser.egg-info \
	   dist \
	   build \
	   ua_parser/_regexes.py

.PHONY: all test clean
