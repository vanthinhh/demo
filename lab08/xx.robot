*** Settings ***
Documentation  File Upload Download in Robot Framework
Library  SeleniumLibrary
Library  OperatingSystem
Library  Collections

*** Test Cases ***
Verify File Download
    [Documentation]  This test case verifies that a user can successfully download a file
    [Tags]  Regression
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    ${prefs}=  Create Dictionary
    ...  download.default_directory=/Users/thinhnguyen/Library/Mobile Documents/com~apple~CloudDocs/WS/CNCT/Testing/lab08/type-of-file/Download
    Call Method  ${options}  add_experimental_option  prefs  ${prefs}
    Create Webdriver  Chrome  options=${options}
    Log    Check Số Lượng File đang có trong Download    
    ${files}  List Files In Directory  /Users/thinhnguyen/Library/Mobile Documents/com~apple~CloudDocs/WS/CNCT/Testing/lab08/type-of-file/Download
    ${file_count}=  Get Length  ${files}
    
    Go To  https://practice-automation.com/file-download/
    
    # Kiểm tra xem phần tử có tồn tại không trước khi thực hiện lệnh xoá
    ${element_present}=  Run Keyword And Return Status  Element Should Be Visible  xpath=//*[@id="post-1042"]/div/div[1]/div/div
    Run Keyword If  ${element_present}  Execute JavaScript  document.querySelector('#post-1042 > div > div:nth-child(1) > div > div').remove()
    
    # Click vào link để download file
    Click Element  xpath=//*[@id="post-1042"]/div/div[3]/div/div/div/div[3]/a
    
    Sleep    5s
    
    # Double click vào vị trí có xpath //*[@id="password_6629152aad772_921"] và điền "aaa"
    Double Click Element    xpath=//*[@id="password_6629152aad772_921"]
    Input Text    xpath=//*[@id="password_6629152aad772_921"]    aaa
