*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}           Chrome
${URL}               https://www.saucedemo.com/
${VALID_PASSWORD}    secret_sauce

*** Test Cases ***
Login With Standard User
    [Documentation]    Test login with standard user credentials
    [Tags]             Smoke
    Open Browser       ${URL}    ${BROWSER}
    Input Text         id=user-name    standard_user
    Input Text         id=password     ${VALID_PASSWORD}
    Click Button       login-button
    Wait Until Page Contains Element    //div[@id='inventory_container']
    [Teardown]         Close Browser

Login With Locked Out User
    [Documentation]    Test login with locked out user credentials
    [Tags]             Smoke
    Open Browser       ${URL}    ${BROWSER}
    Input Text         id=user-name    locked_out_user
    Input Text         id=password     ${VALID_PASSWORD}
    Click Button       login-button
    Wait Until Page Contains Element    //h3[contains(text(),'Sorry, this user has been locked out.')]
    [Teardown]         Close Browser

Login With Problem User
    [Documentation]    Test login with problem user credentials
    [Tags]             Smoke
    Open Browser       ${URL}    ${BROWSER}
    Input Text         id=user-name    problem_user
    Input Text         id=password     ${VALID_PASSWORD}
    Click Button       login-button
    Wait Until Page Contains Element    //div[@id='inventory_container']
    [Teardown]         Close Browser

Login With Performance Glitch User
    [Documentation]    Test login with performance glitch user credentials
    [Tags]             Smoke
    Open Browser       ${URL}    ${BROWSER}
    Input Text         id=user-name    performance_glitch_user
    Input Text         id=password     ${VALID_PASSWORD}
    Click Button       login-button
    Wait Until Page Contains Element    //div[@id='inventory_container']
    [Teardown]         Close Browser

Login With Error User
    [Documentation]    Test login with error user credentials
    [Tags]             Smoke
    Open Browser       ${URL}    ${BROWSER}
    Input Text         id=user-name    error_user
    Input Text         id=password     ${VALID_PASSWORD}
    Click Button       login-button
    Wait Until Page Contains Element    //div[@id='inventory_container']
    [Teardown]         Close Browser
