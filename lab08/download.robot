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
    
    Goto  https://practice-automation.com/file-download/
    Click Element  xpath=//*[@id="post-1042"]/div/div[1]/div/div/div/div[3]/a
    Sleep  5s
    Log    Check Số Lượng File đang có trong Download sau khi tải file pdf
    ${files}  List Files In Directory  /Users/thinhnguyen/Library/Mobile Documents/com~apple~CloudDocs/WS/CNCT/Testing/lab08/type-of-file/Download
    ${file_count}=  Get Length  ${files}
    Should Be True  ${file_count} > 0
    # Xóa file sau khi đã kiểm tra
    Remove Downloaded Files

    Log    Check Số Lượng File đang có trong Download sau khi xoá file trong Download
    ${files}  List Files In Directory  /Users/thinhnguyen/Library/Mobile Documents/com~apple~CloudDocs/WS/CNCT/Testing/lab08/type-of-file/Download
    ${file_count}=  Get Length  ${files}
    Should Be True  ${file_count} == 0
    Close Browser

*** Keywords ***
Remove Downloaded Files
    ${download_directory}=  Set Variable  /Users/thinhnguyen/Library/Mobile Documents/com~apple~CloudDocs/WS/CNCT/Testing/lab08/type-of-file/Download
    ${files}=  List Files In Directory  ${download_directory}
    FOR  ${file}  IN  @{files}
        Remove File  ${download_directory}/${file}
    END