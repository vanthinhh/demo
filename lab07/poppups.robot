*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://practice-automation.com/
${confirmResult_XPATH}    //*[@id="confirmResult"]
${Prompt_XPATH}    //*[@id="promptResult"]
${myTooltip_text_XPATH}    //span[@class='tooltip_text show']
${Click_click me to see a tooltip_XPATH}    //*[@id="post-1055"]/div/div[5]
${alertButton_XPATH}    //*[@id="alert"]/b

*** Test Cases ***
Test Handling Alert Popup_OK
    [Documentation]     Nhấn vào button Alert và xác nhận rằng thông báo là "Hi there, pal!"
    Open Browser    ${URL}     ${BROWSER} 
    Maximize Browser Window
    Mouse Over    xpath=//a[contains(text(),'Popups')]
    Click Element    xpath=//a[contains(text(),'Popups')]
    Page Should Contain    Popups
    Location Should Be    https://practice-automation.com/popups/
    Click Button    xpath=//button[contains(.,'Alert Popup')]
    Sleep    1.2s
    Handle Alert    ACCEPT
    Click Button    xpath=//button[contains(.,'Confirm Popup')]
    Sleep    1.2s
    Handle Alert    ACCEPT
    Page Should Contain    OK it is!
    Sleep    2s
    Click Button    xpath=//button[contains(.,'Confirm Popup')]
    Sleep    1.2s
    Handle Alert    DISMISS
    Page Should Contain    Cancel it is!
    Sleep    2s
    Click Button    xpath=//button[contains(.,'Prompt Popup')]
    Sleep    1.2s
    Handle Alert    DISMISS
    Sleep    3s
    Page Should Contain    Fine, be that way...
    Click Button    xpath=//button[contains(.,'Prompt Popup')]
    Sleep    2s
    Input Text Into Alert    HiHI
    Sleep    5s
    Page Should Contain    Nice to meet you, HiHI!
    Sleep    5s
    Click Element    xpath=//*[@id="post-1055"]/div/div[5]
    Sleep    2s
    Double Click Element    xpath=//*[@id="myTooltip"]
    Close Browser


Test Handling Prompt Popup_Input_OK
    [Documentation]     Nhấn button Prompt Popup , nhập văn bản và Ok
    Open Website
    ${text}     Set Variable    xxxxx
    Sleep     5s
    Prompt Popup
    Input Text Into Alert     ${text}
    ${prompt_text}=    Get Text    ${Prompt_XPATH}
    Run Keyword If    '${prompt_text}' == '${Prompt_XPATH}'    Should Be Equal As Strings    ${prompt_text}    ${Prompt_XPATH}

*** Keywords ***
Open Website
    Open Browser     ${URL}    ${BROWSER}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0, 100)
    Sleep     10s
    Wait Until Page Contains Element    //*[@id="post-36"]/div/div[2]/div/div[3]/div[1]/div/a
    Wait Until Element Is Visible     //*[@id="post-36"]/div/div[2]/div/div[3]/div[1]/div/a    timeout=20s    # Chờ đến khi nút xuất hiện và trở nên nhìn thấy
    Click Element     //*[@id="post-36"]/div/div[2]/div/div[3]/div[1]/div/a
    Sleep     3s

Prompt Popup
    Wait Until Page Contains Element    id=prompt
    Click Element    id=prompt
    Sleep     5s

Click Alert Button
    Wait Until Page Contains Element    ${alertButton_XPATH}
    Click Element    ${alertButton_XPATH}
    Sleep     5s
