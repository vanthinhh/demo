*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://practice-automation.com/gestures/
${BROWSER}    Chrome
${DIV1_XPATH}    //\*\[@id="div1"]
${DIV2_XPATH}    //\*\[@id="div2"]
${IMG_XPATH}    //\*\[@id="dragMe"]

*** Test Cases ***
Test Check Values of Div1 and Div2
    Open Browser To URL
    ${div1_content_before}=    Get Element Attribute    ${DIV1_XPATH}    innerHTML
    ${div2_content_before}=    Get Element Attribute    ${DIV2_XPATH}    innerHTML
    Log    Div1 content before: ${div1_content_before}
    Log    Div2 content before: ${div2_content_before}
    
    Drag And Drop Image From Div1 To Div2
    
    ${div1_content_after}=    Get Element Attribute    ${DIV1_XPATH}    innerHTML
    ${div2_content_after}=    Get Element Attribute    ${DIV2_XPATH}    innerHTML
    Log    Div1 content after: ${div1_content_after}
    Log    Div2 content after: ${div2_content_after}
    Sleep    5s

    Should Not Be Equal    ${div1_content_before}    ${div1_content_after}
    Should Not Be Equal    ${div2_content_before}    ${div2_content_after}
    
*** Keywords ***
Open Browser To URL
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Drag And Drop Image From Div1 To Div2
    ${img_element}=    Get WebElement    ${IMG_XPATH}
    ${div2_element}=    Get WebElement    ${DIV2_XPATH}
    Drag And Drop    ${img_element}    ${div2_element}