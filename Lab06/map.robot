*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://practice-automation.com/gestures/
${BROWSER}    Chrome
${ZOOM_IN_BUTTON_XPATH}    /html/body/div[1]/div[2]/div/div/main/div/article/div/div[6]/div/div/div/div/div/div[2]//div[2]/div[2]/div[1]
${ZOOM_OUT_BUTTON_XPATH}    /html/body/div[1]/div[2]/div/div/main/div/article/div/div[6]/div/div/div/div/div/div[2]//div[2]/div[2]/div[3]
*** Test Cases ***
Double Click Zoom Buttons
    Open Browser To URL
    Sleep    30s
    Double Click Element    ${ZOOM_IN_BUTTON_XPATH}
    Double Click Element    ${ZOOM_OUT_BUTTON_XPATH}
    Close Browser

*** Keywords ***
Open Browser To URL
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
