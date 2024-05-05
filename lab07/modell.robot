*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}   chrome
${SELSPEED}  0.0s
${MOVE_ME_XPATH}    //*[@id="contact-form-comment-g1051-message"]

*** Test Cases ***
robotframework-testing_selenium
    [Setup]  Run Keywords  Open Browser  https://practice-automation.com/modals/?contact-form-id=1051&contact-form-sent=15426&contact-form-hash=78fe9e23dbcfea1efb3fd77344a5f4fd08fa3962&_wpnonce=976461c645#contact-form-1051  ${BROWSER}
    ...              AND   Set Selenium Speed  ${SELSPEED}
    Maximize Browser Window
    # open    https://practice-automation.com/modals/?contact-form-id=1051&contact-form-sent=15426&contact-form-hash=78fe9e23dbcfea1efb3fd77344a5f4fd08fa3962&_wpnonce=976461c645#contact-form-1051
    click    id=simpleModal
    click    xpath=//div[@id='popmake-1318']/button
    click    id=formModal
    click    xpath=//div[@id='contact-form-1051']/form/p/button
    open    https://practice-automation.com/modals/?contact-form-id=1051&contact-form-sent=15893&contact-form-hash=78fe9e23dbcfea1efb3fd77344a5f4fd08fa3962&_wpnonce=d41c61980f#contact-form-1051
    click    id=formModal
    click    id=g1051-name
    type    id=g1051-name    Thịnh
    click    xpath=//div[@id='contact-form-1051']/form/p/button
    open    https://practice-automation.com/modals/?contact-form-id=1051&contact-form-sent=15894&contact-form-hash=78fe9e23dbcfea1efb3fd77344a5f4fd08fa3962&_wpnonce=daaac5cbce#contact-form-1051
    click    id=formModal
    click    id=g1051-email
    type    id=g1051-email    thinhprotec@gmail.com
    click    xpath=//div[@id='contact-form-1051']/form/p/button
    open    https://practice-automation.com/modals/?contact-form-id=1051&contact-form-sent=15896&contact-form-hash=78fe9e23dbcfea1efb3fd77344a5f4fd08fa3962&_wpnonce=f90ec19b8f#contact-form-1051
    click    id=formModal
    click    id=contact-form-comment-g1051-message
    type    id=contact-form-comment-g1051-message    dsa
    click    xpath=//div[@id='contact-form-1051']/form/p/button
    open    https://practice-automation.com/modals/?contact-form-id=1051&contact-form-sent=15897&contact-form-hash=78fe9e23dbcfea1efb3fd77344a5f4fd08fa3962&_wpnonce=c94e31f27f#contact-form-1051
    click    id=formModal
    click    id=g1051-name
    type    id=g1051-name    Thịnh
    click    id=g1051-email
    type    id=g1051-email    thinhprotec@gmail.com
    click    id=contact-form-comment-g1051-message
    type    id=contact-form-comment-g1051-message    dsa
    click    xpath=//div[@id='contact-form-1051']/form/p/button
    open    https://practice-automation.com/modals/?contact-form-id=1051&contact-form-sent=15898&contact-form-hash=78fe9e23dbcfea1efb3fd77344a5f4fd08fa3962&_wpnonce=875d0749d6#contact-form-1051
    click    id=formModal
    click    xpath=//div[@id='contact-form-1051']/form/div[3]
    click    id=contact-form-comment-g1051-message
    type    id=contact-form-comment-g1051-message    hi
    click    xpath=//div[@id='contact-form-1051']/form/p/button
    open    https://practice-automation.com/modals/?contact-form-id=1051&contact-form-sent=15899&contact-form-hash=78fe9e23dbcfea1efb3fd77344a5f4fd08fa3962&_wpnonce=1c81ae9192#contact-form-1051
    Click Button    //*[@id="formModal"]
    Move Element To Position    16    16
    Sleep    2s
    
    Move Element To Position    100    50
    Sleep    2s
    
    Move Element To Position    250    100
    Sleep    2s
    
    Move Element To Position    500    150
    Sleep    2s



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
Move Element To Position
    [Arguments]    ${width}    ${height}
    ${element}=    Get WebElement    ${MOVE_ME_XPATH}
    ${element_id}=    Get Element Attribute    ${element}    id
    Execute Javascript    document.getElementById("${element_id}").style.width = "${width}px"; document.getElementById("${element_id}").style.height = "${height}px";