*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://practice-automation.com/click-events/
${BROWSER}    Chrome

*** Test Cases ***
Test Button Click
    Open Browser To URL
    Verify Initial Text Before Click
    Click Button And Verify Text    xpath=//*[@id="post-3145"]/div/div[3]/div/div/div/div[1]/button    Meow!
    Click Button And Verify Text    xpath=//*[@id="post-3145"]/div/div[3]/div/div/div/div[2]/button    Woof!
    Click Button And Verify Text    xpath=//*[@id="post-3145"]/div/div[5]/div[1]/button    Oink!
    Click Button And Verify Text    xpath=//*[@id="post-3145"]/div/div[5]/div[2]/button    Moo!

*** Keywords ***
Open Browser To URL
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Verify Initial Text Before Click
    ${demo_text}=    Get Text    xpath=//*[@id="demo"]
    Should Be Empty    ${demo_text}    msg=Initial text is not empty before clicking the button

Click Button And Verify Text
    [Arguments]    ${button_xpath}    ${expected_text}
    Click Element    ${button_xpath}
    ${demo_text}=    Get Text    xpath=//*[@id="demo"]
    Should Be Equal As Strings    ${demo_text}    ${expected_text}    msg=Text is not "${expected_text}"
