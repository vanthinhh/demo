*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}   chrome
${SELSPEED}  0.0s
${Previous}    //*[@id="ui-datepicker-div"]/div/a[1]
${Next}    //*[@id="ui-datepicker-div"]/div/a[2]
*** Test Cases ***
robotframework-testing_selenium
    [Setup]  Run Keywords  Open Browser  https://practice-automation.com/calendars/?contact-form-hash=412068ef7f61d0abe68f96678b697e83d4b93b37  ${BROWSER}
    ...              AND   Set Selenium Speed  ${SELSPEED}
    Maximize Browser Window
    # open    https://practice-automation.com/calendars/?contact-form-hash=412068ef7f61d0abe68f96678b697e83d4b93b37
    click    xpath=//div[@id='contact-form-1065']/form/div/div/label
    click    xpath=//div[@id='top-wrap']/section/div/nav
    click    id=g1065-selectorenteradate
    click    xpath=//article[@id='post-1065']/div/div[2]
    click    xpath=//button[@type='submit']
    click    link=Go back
    click    id=g1065-selectorenteradate
    click    link=17
    click    xpath=//button[@type='submit']
    click    link=Go back
    click    id=g1065-selectorenteradate
    Click Element    ${Previous}
    Click Element    ${Previous}
    Click Element    ${Previous}
    Click Element    ${Previous}
    Click Element    ${Previous}
    Click Element    ${Previous}
    Click Element    ${Previous}
    Click Element    ${Previous}
    Click Element    ${Previous}
    click    link=1
    click    xpath=//button[@type='submit']
    click    link=Go back
    click    id=g1065-selectorenteradate
    Click Element    ${Next}
    Click Element    ${Next}
    Click Element    ${Next}
    Click Element    ${Next}
    Click Element    ${Next}
    Click Element    ${Next}
    Click Element    ${Next}
    Click Element    ${Next}
    Click Element    ${Next}
    Click Element    ${Next}
    click    link=28
    click    xpath=//button[@type='submit']
    [Teardown]  Close Browser

*** Keywords ***
open
    [Arguments]    ${element}
    Go To          ${element}

clickAndWait
    [Arguments]    ${element}
    Click Element  ${element}

click
    [Arguments]    ${element}
    Click Element  ${element}

sendKeys
    [Arguments]    ${element}    ${value}
    Press Keys     ${element}    ${value}

submit
    [Arguments]    ${element}
    Submit Form    ${element}

type
    [Arguments]    ${element}    ${value}
    Input Text     ${element}    ${value}

selectAndWait
    [Arguments]        ${element}  ${value}
    Select From List By Value   ${element}  ${value}

select
    [Arguments]        ${element}  ${value}
    Select From List By Value   ${element}  ${value}

verifyValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

verifyTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertConfirmation
    [Arguments]                  ${value}
    Alert Should Be Present      ${value}

assertText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

assertTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

waitForTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

doubleClick
    [Arguments]           ${element}
    Double Click Element  ${element}

doubleClickAndWait
    [Arguments]           ${element}
    Double Click Element  ${element}

goBack
    Go Back

goBackAndWait
    Go Back

runScript
    [Arguments]         ${code}
    Execute Javascript  ${code}

runScriptAndWait
    [Arguments]         ${code}
    Execute Javascript  ${code}

setSpeed
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

setSpeedAndWait
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

verifyAlert
    [Arguments]              ${value}
    Alert Should Be Present  ${value}
