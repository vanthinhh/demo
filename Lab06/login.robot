*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://practice-automation.com/hover/
${BROWSER}    Chrome

*** Test Cases ***
Test Case 4
    Open Browser To URL
    Verify Web Page Size

Test Case 5
    Open Browser To URL
    Minimize Browser Window
    Verify Web Page Minimized

*** Keywords ***
Open Browser To URL
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Verify Web Page Size
    ${size}=    Get Window Size
    ${width}=    Set Variable    ${size}[0]
    ${height}=    Set Variable    ${size}[1]
    Should Be Equal As Numbers    ${width}    1440    msg=Page width is not as expected
    Should Be Equal As Numbers    ${height}    799    msg=Page height is not as expected

Minimize Browser Window
    Set Window Size    800    600

Verify Web Page Minimized
    ${size}=    Get Window Size
    ${width}=    Set Variable    ${size}[0]
    ${height}=    Set Variable    ${size}[1]
    Should Be Equal As Numbers    ${width}    800    msg=Page width is not as expected when browser window is minimized
    Should Be Equal As Numbers    ${height}    600    msg=Page height is not as expected when browser window is minimized
