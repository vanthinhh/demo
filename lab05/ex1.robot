*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        https://practice-automation.com/tables/

*** Test Cases ***
Open Browser and Navigate to URL
    [Documentation]    Open the browser and navigate to the specified URL
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Tables    # Chờ đến khi trang hiển thị "Tables"
    Location Should Be    ${URL}    # Kiểm tra URL hiện tại
