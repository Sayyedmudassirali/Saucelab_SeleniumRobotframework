*** Settings ***
Library     SeleniumLibrary
Library     os
Library     DataDriver      ../TestData/TestData.xlsx       sheet_name=TestData
Resource        ../Resources/Keyword_SauceLab.robot

Suite Setup         OpeningMyBrowser
Suite Teardown      closeMyBrowser
Test Template       CheckUsernamePasswords

*** Test Cases ***
Check Username and Passwords with Excel     ${username}     ${password}     ${errormsg}


*** Keywords ***
CheckUsernamePasswords
        [Arguments]     ${username}     ${password}     ${errormsg}
        set selenium speed  3 seconds
        input text      xpath://*[@id="user-name"]        ${username}
        input text      xpath://*[@id="password"]            ${password}
        click element  xpath://*[@id="login-button"]
        element should contain   xpath://*[@id="login_button_container"]//h3     ${errormsg}
