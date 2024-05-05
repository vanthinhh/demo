*** Settings ***
Suite Setup       Connect To Database   MySQLdb    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
Suite Teardown    Disconnect From Database
Library           DatabaseLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${DBHost}         localhost	
${DBName}         lab9_test_auto
${DBPass}         	
${DBPort}         3306
${DBUser}         root

*** Test Cases ***
Create PHONGBAN table
    ${table_exist} =    Query    SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = '${DBName}' AND table_name = 'PHONGBAN'
    Run Keyword If    '${table_exist[0][0]}' > '0'    Execute SQL String    DROP TABLE PHONGBAN
    ${output} =    Execute SQL String    CREATE TABLE PHONGBAN (MAPB CHAR(2) PRIMARY KEY, TENPB NVARCHAR(50) NOT NULL)
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Create NHANVIEN table
    ${table_exist} =    Query    SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = '${DBName}' AND table_name = 'NHANVIEN'
    Run Keyword If    '${table_exist[0][0]}' > '0'    Execute SQL String    DROP TABLE NHANVIEN
    ${output} =    Execute SQL String    CREATE TABLE NHANVIEN (MANV CHAR(4) PRIMARY KEY, HOTEN NVARCHAR(100) NOT NULL, NGAYSINH DATE, DIACHI NVARCHAR(200), MAPB CHAR(2), FOREIGN KEY (MAPB) REFERENCES PHONGBAN(MAPB))
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Create CHAMCONG table
    ${table_exist} =    Query    SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = '${DBName}' AND table_name = 'CHAMCONG'
    Run Keyword If    '${table_exist[0][0]}' > '0'    Execute SQL String    DROP TABLE CHAMCONG
    ${output} =    Execute SQL String    CREATE TABLE CHAMCONG (MANV CHAR(4), NGAY DATE, GIOVAO TIME, GIORA TIME, PRIMARY KEY (MANV, NGAY), FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV))
    Log    ${output}
    Should Be Equal As Strings    ${output}    None
