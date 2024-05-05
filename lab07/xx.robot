*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://practice-automation.com/popups/
${BROWSER}      Chrome
${ALERT_XPATH}  xpath=//*[@id="alert"]
${CONFIRM_XPATH}  xpath=//*[@id="confirm"]
${PROMPT_XPATH}  xpath=//*[@id="prompt"]
*** Test Cases ***
Test Hover Effect
    Open Browser To URL
    Verify Initial Color
    Hover And Verify Color Change
    Move Mouse Away And Verify Color Change
    Hover And Verify Color Change1
    Move Mouse Away And Verify Color Change1
*** Keywords ***
Open Browser To URL
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Verify Initial Color
    ${initial_color}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("button")).getPropertyValue("color")
    Should Be Equal As Strings    ${initial_color}    rgb(255, 255, 255)    msg=Initial text color is not white

Hover And Verify Color Change
    Mouse Over    ${ALERT_XPATH} 
    ${hovered_color}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("button")).getPropertyValue("color")
    Should Be Equal As Strings    ${hovered_color}    rgb(0, 0, 0)    msg=Text color is not black after hover

Move Mouse Away And Verify Color Change
    Mouse Out    ${ALERT_XPATH} 
    ${away_color}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("button")).getPropertyValue("color")
    Should Be Equal As Strings    ${away_color}    rgb(255, 255, 255)    msg=Text color is not white after moving mouse away
Hover And Verify Color Change1
    Mouse Over    ${CONFIRM_XPATH}
    ${hovered_color}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("button")).getPropertyValue("color")
    Should Be Equal As Strings    ${hovered_color}    rgb(255, 255, 255)    msg=Text color is not black after hover

Move Mouse Away And Verify Color Change1
    Mouse Out    ${CONFIRM_XPATH}
    ${away_color}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("button")).getPropertyValue("color")
    Should Be Equal As Strings    ${away_color}    rgb(255, 255, 255)    msg=Text color is not white after moving mouse away
Hover And Verify Color Change2
    Mouse Over    ${PROMPT_XPATH} 
    ${hovered_color}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("button")).getPropertyValue("color")
    Should Be Equal As Strings    ${hovered_color}    rgb(255, 255, 255)    msg=Text color is not black after hover

Move Mouse Away And Verify Color Change2
    Mouse Out   ${PROMPT_XPATH} 
    ${away_color}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("button")).getPropertyValue("color")
    Should Be Equal As Strings    ${away_color}    rgb(255, 255, 255)    msg=Text color is not white after moving mouse away
