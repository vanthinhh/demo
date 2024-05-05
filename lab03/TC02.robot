*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            https://practicetestautomation.com/practice-test-login/
${USERNAME}       student
${PASSWORD}       Password123

*** Test Cases ***
Login and Navigate Test
    Open Browser    ${URL}    ${BROWSER}
    Input Text    username    ${USERNAME}
    Input Password    password    ${PASSWORD}
    Submit Form
    Wait Until Page Contains    practicetestautomation.com/logged-in-successfully/
    Log    Login was successful!
    Click Element    xpath=//*[@id="menu-item-20"]/a
    Wait Until Page Contains    practicetestautomation.com/practice/
    Log    Navigated to PRACTICE successfully
    Click Element    xpath=//*[@id="loop-container"]/div/article/div[2]/div[2]/div[1]/p/a
    Wait Until Page Contains    practicetestautomation.com/practice-test-exceptions/
    Log    Navigated to Test Exceptions successfully

*** Keywords ***
Submit Form
    Click Button    Submit