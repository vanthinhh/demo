*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://practice-automation.com/tables/
${TABLE_XPATH}    //*[@id="post-1076"]/div/figure/table
${ALL_CELLS_XPATH}    ${TABLE_XPATH}//td

*** Test Cases ***

Count All Cells In Table
    [Documentation]    Count all cells in the table and log the result
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    ${all_cells}    Get WebElements    ${ALL_CELLS_XPATH}
    ${cell_count}    Get Length    ${all_cells}
    
    Log    Number of cells in the table: ${cell_count}
    
    [Teardown]    Close Browser
