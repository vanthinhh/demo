*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        https://practice-automation.com/tables/
${ITEM_XPATH}    //*[@id="post-1076"]/div/figure/table/tbody/tr[1]/td[1]/strong
${PRICE_XPATH}    //*[@id="post-1076"]/div/figure/table/tbody/tr[1]/td[2]/strong

*** Test Cases ***
Verify Table Headers
    [Documentation]    Verify that the table headers for item and price are visible

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${ITEM_XPATH}
    Wait Until Page Contains Element    ${PRICE_XPATH}
    ${item_element}    Get WebElement    ${ITEM_XPATH}
    ${price_element}    Get WebElement    ${PRICE_XPATH}
    Element Should Be Visible    ${item_element}
    Element Should Be Visible    ${price_element}
    [Teardown]    Close Browser
