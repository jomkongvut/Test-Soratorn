*** Settings ***
Library             Browser
Library             RequestsLibrary
Library             OperatingSystem
Library             Collections
Resource            ../Variables/Common.robot

*** Keywords ***
Open Web Browser
    New Browser     ${browser}      headless=False
    New Page        ${url}
Verify Response 200
    [Arguments]     ${url}
    ${response}=        RequestsLibrary.GET     ${url}      expected_status=200

Run Test Teardown
    Browser.Close Browser

Request GET
    [Arguments]     ${url}
    ${headers}       Create Dictionary      x-store-code=en
    ${response}=        RequestsLibrary.GET     url=${url}        headers=${headers}           expected_status=200
    Return from keyword     ${response}

Verify Response Key
    [Arguments]     ${dict}     @{text}
    FOR    ${key}      IN      @{text}
        Dictionary Should Contain Key       ${dict}     ${key}
    END

Verify Response Value
    [Arguments]     ${dict}     ${text}
    Dictionary Should Contain Value       ${dict}     ${key}
