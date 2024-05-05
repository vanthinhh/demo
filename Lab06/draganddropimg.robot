*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://practice-automation.com/gestures/
${BROWSER}    Chrome
${DIV1_XPATH}    //*[@id="div1"]
${DIV2_XPATH}    //*[@id="div2"]
${IMG_XPATH}    //*[@id="dragMe"]

*** Test Cases ***
Test Check Values of Div1 and Div2
    Open Browser To URL
    ${div1_content}=    Get Element Attribute    ${DIV1_XPATH}    innerHTML
    ${div2_content}=    Get Element Attribute    ${DIV2_XPATH}    innerHTML
    Log    Div1 content: ${div1_content}
    Log    Div2 content: ${div2_content}
    
    Drag And Drop Image From Div1 To Div2
    Sleep    10s
    ${div1_content}=    Get Element Attribute    ${DIV1_XPATH}    innerHTML
    ${div2_content}=    Get Element Attribute    ${DIV2_XPATH}    innerHTML

*** Keywords ***
Open Browser To URL
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Drag And Drop Image From Div1 To Div2
    ${img_element}=    Get WebElement    ${IMG_XPATH}
    ${div2_element}=    Get WebElement    ${DIV2_XPATH}
    Drag And Drop    ${img_element}    ${div2_element}