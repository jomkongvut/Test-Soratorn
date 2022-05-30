*** Settings ***
Library             Browser
Resource            Common.robot
Resource            ../Repositorys/SearchFeature.robot

*** Keywords ***
Input Search
    [Arguments]     ${data}
    Browser.Type Text       ${SearchBoxtb}      ${data}

Verify Categories Suggestions Count
    [Arguments]     ${count}
    Browser.Wait For Elements State     ${SuggestionsCategories}      visible
    ${result}=       Browser.Get Element Count      ${SuggestionsCategoriesCount}
    Should Be Equal     ${${count}}        ${result}

Verify Categorie Suggestion Detail By Index
    [Arguments]     ${index}    ${text}
    Browser.Get Text      //*[contains(@class,"suggestion_container")]//*[contains(@data-suggestion-label,"categories")][${index}]      ==      ${text}
    
Verify Products Suggestions Count
    [Arguments]     ${count}
    Browser.Wait For Elements State       ${SuggestionsProducts}       visible
    ${result}=       Browser.Get Element Count      ${SuggestionsProductsCount}
    Should Be Equal     ${${count}}        ${result}

Verify Product Suggestion Detail By Index
    [Arguments]     ${index}    ${text}     ${price}
    Browser.Get Text      //*[@data-suggestion-productid][${index}]//div[@data-suggestion-label]    ==      ${text}
    Browser.Get Text      //*[@data-suggestion-productid][${index}]//div[@data-product-search-result]       ==      ${price}
    # ${imageSrc}=        SeleniumLibrary.Get Element Attribute        //*[@data-suggestion-productid][${index}]//img     src
    ${imageSrc}=        Browser.Get Property        //*[@data-suggestion-productid][${index}]//img      src
    Verify Response 200         ${imageSrc}

Verify Search Terms Suggestions Count
    [Arguments]     ${count}
    Browser.Wait For Elements State       ${SuggestionsTerms}        visible
    ${result}=       Browser.Get Element Count      ${SuggestionsTermsCount}
    Should Be Equal     ${${count}}        ${result}

Verify Search Terms Suggestion Detail By Index
    [Arguments]     ${index}    ${text}
    Browser.Get Text      //*[contains(@class,"suggestion_container")]//*[contains(@data-suggestion-label,"suggestion")][${index}]/div[1]       ==      ${text}
    
Click Search Term By Index
    [Arguments]     ${index}
    Browser.Click        //*[contains(@class,"suggestion_container")]//*[contains(@data-suggestion-label,"suggestion")][${index}]

Click Categorie By Index
    [Arguments]     ${index}
    Browser.Click        //*[contains(@class,"suggestion_container")]//*[contains(@data-suggestion-label,"categories")][${index}]

Click Categorie By Name
    [Arguments]     ${name}
    Browser.Click        //*[contains(@class,"suggestion_container")]//*[contains(@data-suggestion-label,"categories")][contains(text(),"${name}")]

Click Product By Index
    [Arguments]     ${index}
    Browser.Click        //*[@data-suggestion-productid][${index}]//div[@data-suggestion-label]

Click Product By Name
    [Arguments]     ${name}
    Browser.Click        //*[@data-suggestion-productid][contains(@data-suggestion-name,'${name}')]

URL Should Be Equal
    [Arguments]     ${url}
    Get Url     ==      ${url}
    # ${result}=      Get Url     ==      ${url}
    # Should Be Equal     ${result}       ${url}

Wait Search Results Page
    [Arguments]     ${timeout}=10s
    Browser.Wait For Elements State     //*[contains(text(),'product results found for')]       visible       timeout=${timeout}

Wait Product Page
    [Arguments]     ${timeout}=10s
    Browser.Wait For Elements State     //*[@data-testid="pnl-productHeader"]       visible       timeout=${timeout}
 
Click Search Button
    Browser.Click        ${SearchButtonbtn}

Verify Product Image Status Code 200 By Index
    [Arguments]     ${index}
    ${imageSrc}=        Browser.Get Property        (//*[@data-testid="pnl-productPreview"])[${index}]//img[@data-product-name]      src
    ${response}=        RequestsLibrary.GET     ${imageSrc}      expected_status=200

Verify Product Name By Index
    [Arguments]     ${index}        ${name}
    Browser.Get Text        (//*[@data-testid="pnl-productPreview"])[${index}]//*[contains(@id,"lbl-ProductPreview-Name-")]        ==      ${name}

Verify Product Serial Number By Index
    [Arguments]     ${index}        ${serial}
    Browser.Get Text        (//*[@data-testid="pnl-productPreview"])[${index}]//*[contains(@id,"lbl-ProductPreview-Name-")]/..//following-sibling::div        ==      ${serial}

Verify Product Price By Index
    [Arguments]     ${index}        ${price}
    Browser.Get Text        (//*[@data-testid="pnl-productPreview"])[${index}]//*[contains(@id,"lbl-ProductList-Price-")]        ==      ${price}
