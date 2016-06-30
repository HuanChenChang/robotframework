*** Settings ***
Documentation  A resource file containing the application specific keywords
Library		Selenium2Library

*** Test Cases ***
GOTO CATCHPLAY
	Open Browser  www.catchplay.com  ff
	Close Browser