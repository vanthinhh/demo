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
    # Add a new row
    Click Button    Add
    Wait Until Page Contains Element    xpath=//*[@id="row2"]/input    timeout=15s
    Wait Until Element Is Visible    xpath=//*[@id="row2"]/input    timeout=15s
    Log    Row 2 was added
    # Enter 'something' in the input element
    Input Text    xpath=//*[@id="row2"]/input    something
    Log    Entered 'something' in the input element
    # Click 'Save'
    Click Button    xpath=/html/body/div/div/section/section/div/div[3]/div/button[1]
    Wait Until Element Is Visible    xpath=//button[contains(text(),'Remove')]    timeout=15s
    Log    Row 2 was saved
    # Click 'Remove'
    Click Button    xpath=//button[contains(text(),'Remove')]
    Wait Until Element Is Not Visible    xpath=//button[contains(text(),'Remove')]    timeout=15s
    Log    Remove action is successful

*** Keywords ***
Submit Form
    Click Button    Submit