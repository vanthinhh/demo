*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL1}    https://practice-automation.com/popups/
${URL2}    https://practice-automation.com/calendars/
${URL3}    https://practice-automation.com/modals/
${BROWSER}    Chrome
${TOLERANCE}    5

*** Test Cases ***
Test Case 4
    Open Browser To URL    ${URL1}
    Verify Web Page Size

Test Case 5
    Open Browser To URL    ${URL1}
    Minimize Browser Window
    Verify Web Page Minimized

Test Case 6
    Open Browser To URL    ${URL2}
    Verify Web Page Size

Test Case 7
    Open Browser To URL    ${URL2}
    Minimize Browser Window
    Verify Web Page Minimized

Test Case 8
    Open Browser To URL    ${URL3}
    Verify Web Page Size

Test Case 9
    Open Browser To URL    ${URL3}
    Minimize Browser Window
    Verify Web Page Minimized

*** Keywords ***
Open Browser To URL
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window

Verify Web Page Size
    ${size}=    Get Window Size
    ${width}=    Set Variable    ${size}[0]
    ${height}=    Set Variable    ${size}[1]
    Verify Web Page Size Within Tolerance    ${width}    1440    ${TOLERANCE}    msg=Page width is not as expected
    Verify Web Page Size Within Tolerance    ${height}    801    ${TOLERANCE}    msg=Page height is not as expected

Minimize Browser Window
    Set Window Size    800    600

Verify Web Page Minimized
    ${size}=    Get Window Size
    ${width}=    Set Variable    ${size}[0]
    ${height}=    Set Variable    ${size}[1]
    Verify Web Page Size Within Tolerance    ${width}    800    ${TOLERANCE}    msg=Page width is not as expected when browser window is minimized
    Verify Web Page Size Within Tolerance    ${height}    600    ${TOLERANCE}    msg=Page height is not as expected when browser window is minimized

Verify Web Page Size Within Tolerance
    [Arguments]    ${actual}    ${expected}    ${tolerance}    ${msg}
    ${diff}=    Evaluate    abs(${actual} - ${expected})
    Should Be True    ${diff} <= ${tolerance}    msg=${msg}
