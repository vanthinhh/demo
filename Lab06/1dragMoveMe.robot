*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://practice-automation.com/modals
${BROWSER}    Chrome
${MOVE_ME_XPATH}    //*[@id="contact-form-comment-g1051-message"]

*** Test Cases ***
Test Move Element to Different Positions
    Open Browser To URL
    Click Button    //*[@id="formModal"]
    Move Element To Position    16    16
    Sleep    2s
    
    Move Element To Position    100    50
    Sleep    2s
    
    Move Element To Position    250    100
    Sleep    2s
    
    Move Element To Position    500    150
    Sleep    2s

*** Keywords ***
Open Browser To URL
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
Move Element To Position
    [Arguments]    ${width}    ${height}
    ${element}=    Get WebElement    ${MOVE_ME_XPATH}
    ${element_id}=    Get Element Attribute    ${element}    id
    Execute Javascript    document.getElementById("${element_id}").style.width = "${width}px"; document.getElementById("${element_id}").style.height = "${height}px";