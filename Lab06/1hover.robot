*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://practice-automation.com/hover/
${BROWSER}    Chrome

*** Test Cases ***
Test Case 1: Verify Text and Color Before Hover
    Open Browser To URL
    Verify Text and Color Before Hover
    Close All Browsers


Test Case 2: Verify Text and Color After Hover
    Open Browser To URL
    Hover After Hover
    Verify Text and Color After Hover
    Close All Browsers

Test Case 3: Verify Text and Color After Hover
    Open Browser To URL
    Hover After Hover
    Verify Text and Color After Hover
    Hover Before Hover
    Close All Browsers
*** Keywords ***
Open Browser To URL
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Hover Before Hover
    Click Element    xpath://h3[@id='mouse_over']    

Hover After Hover
    Mouse Over    xpath://h3[@id='mouse_over']


Verify Text and Color Before Hover
    ${text_before_hover}=    Get Text    xpath://h3[@id='mouse_over']
    ${color_before_hover}=    Execute Javascript    return window.getComputedStyle(document.querySelector('#mouse_over')).getPropertyValue('color')
    Should Be Equal As Strings    ${text_before_hover}    Mouse over me    msg=Text before hover is not as expected
    Should Be Equal As Strings    ${color_before_hover}    rgb(0, 170, 239)    msg=Color before hover is not #00aaef


Verify Text and Color After Hover
    ${text_after_hover}=    Get Text    xpath://h3[@id='mouse_over']
    ${color_after_hover}=    Get Element Attribute    xpath://h3[@id='mouse_over']    style
    Should Be Equal As Strings    ${text_after_hover}    You did it!    msg=Text after hover is not as expected
    Should Contain    ${color_after_hover}    color: green    msg=Color after hover is not green


Verify Text and Color After No Hover
    ${text_after_hover}=    Get Text    xpath://h3[@id='mouse_over']
    ${color_after_hover}=    Get Element Attribute    xpath://h3[@id='mouse_over']    style
    Should Be Equal As Strings    ${text_after_hover}    You did it!    msg=Text after hover is not as expected
    Should Contain    ${color_after_hover}    color: green    msg=Color after hover is not green
    Mouse Over    xpath://*[@id="top-wrap"]/section/div/nav/span/span[2]
    ${color_after_no_hover}=    Get Element Attribute    xpath://h3[@id='mouse_over']    style
    Should Contain    ${color_after_no_hover}    color: black    msg=Color after no hover is not black
