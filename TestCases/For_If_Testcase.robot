*** Settings ***
Library     SeleniumLibrary
Resource        ../Resources/Keyword_SauceLab.robot


*** Test Cases ***
IF and ELSE IF Statement
            [Tags]      IF
            [Documentation]     Check number of items on with IF Statement
            SucessfullLogin

            ${items}=   get element count    xpath://*[@class="inventory_list"]/div

            run keyword if    ${items} == 10    log to console  Output:Total 10 items are there
            ...   ELSE IF     ${items} == 6    log to console  Output:Total 6 items are there
            ...   ELSE      ${items} > 10    log to console     Output:More than 10 items are present

For Loop Statement
            [Tags]      ForLoop
            [Documentation]     with for loop text in the webelements on the page and store
            SucessfullLogin

            @{result_list}=     get webelements     xpath://*[@class="inventory_list"]/div

            FOR     ${element}      IN      @{result_list}
                ${text}=    get text    ${element}
            END


*** Keywords ***
SucessfullLogin
            OpeningMyBrowser
            input text      xpath://*[@id="user-name"]        standard_user
            input text      xpath://*[@id="password"]         secret_sauce
            press keys  xpath://*[@id="login-button"]           RETURN
