*** Settings ***
Library     SeleniumLibrary



*** Keywords ***
OpeningMyBrowser
            open browser    https://www.saucedemo.com/      chrome
            maximize browser window
            sleep  2 seconds


closeMyBrowser
         close all browsers
