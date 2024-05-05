*** Settings ***
Documentation  Assignment 3: Perform actions on Window Operations page and verify
Library  SeleniumLibrary

*** Variables ***
${URL}  https://practice-automation.com/window-operations/
${BROWSER}  Chrome
${Page Index}    https://practice-automation.com/window-operations/
${Page Swap}    https://automatenow.io/

*** Test Cases ***
Perform Actions on Window Operations Page and Verify
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Sleep  2s  # Wait for the page to load completely
     # Check if the current page link matches ${Page Index}
    ${current_url}=  Get Location
    Should Be Equal As Strings  ${current_url}  ${Page Index}
    
    # Click "New Tab" button and switch to the new window
    Click Element  xpath://*[@id="post-1147"]/div/p[2]/button
    Switch Window  NEW
    Page Should Contain  Home | automateNow
    
    # Check if the new window link matches ${Page Swap}
    ${new_window_url}=  Get Location
    Should Be Equal As Strings  ${new_window_url}  ${Page Swap}
    
    Close Window
    Switch Window  MAIN
    
    # Check if the current page link matches ${Page Index}
    ${current_url}=  Get Location
    Should Be Equal As Strings  ${current_url}  ${Page Index}
    
    # Click "Replace Window" button
    Click Element  xpath://*[@id="post-1147"]/div/p[4]/button
    Switch Window  MAIN
    
    # Check if the current page link matches ${Page Swap}
    ${current_url}=  Get Location
    Should Be Equal As Strings  ${current_url}  ${Page Swap}
    
    Page Should Contain  Home | automateNow
    
    # Navigate back to the main page
    Go To    ${URL}
    Sleep    5s
    
    # Click "New Window" button and switch to the new window
    Click Element  xpath://*[@id="post-1147"]/div/p[6]/button
    Switch Window  NEW
    Page Should Contain  Home | automateNow
    
    # Check if the new window link matches ${Page Swap}
    ${new_window_url}=  Get Location
    Should Be Equal As Strings  ${new_window_url}  ${Page Swap}
    
    [Teardown]  Close All Browsers
