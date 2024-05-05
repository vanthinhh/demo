*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            https://practicetestautomation.com/practice-test-login/
${USERNAME}       student
${PASSWORD}       Password123

*** Test Cases ***
Login Test
    Open Browser    ${URL}    ${BROWSER}
    Input Text    username    ${USERNAME}
    Input Password    password    ${PASSWORD}
    Submit Form
    Wait Until Page Contains    practicetestautomation.com/logged-in-successfully/
    Log    Login was successful!

*** Keywords ***
Submit Form
    Click Button    Submit