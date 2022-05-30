*** Settings ***
Resource            ../Resource/Keywords/Common.robot
Resource            ../Resource/Keywords/SearchFeature.robot
Test Teardown       Common.Run Test Teardown

*** Test Cases ***
UI _ Verify Search Suggestions Search By Full Name
    Open Web Browser
    Input Search        SANDISK Flash Drive Ultra Flair USB 3.0 SDCZ73_128G_G46
    Log to console      s
    Verify Categories Suggestions Count         3
    Verify Categorie Suggestion Detail By Index      index=1       text=in Flash Drives
    Verify Categorie Suggestion Detail By Index      index=2       text=in Storage
    Verify Categorie Suggestion Detail By Index      index=3       text=in WORK-FROM-HOME-IT-GADGET-2022
    Verify Products Suggestions Count           6
    Verify Product Suggestion Detail By Index       index=1       text=SANDISK Flash Drive Ultra Flair USB 3.0 SDCZ73_128G_G46                             price=฿850.00
    Verify Product Suggestion Detail By Index       index=2       text=SanDisk USB Drive Ultra Flair 32GB USB 3.0 Silver (SDCZ73_032G_G46B)                price=฿169.00
    Verify Product Suggestion Detail By Index       index=3       text=SanDisk USB Drive Ultra Shift USB 3.0 128GB (SDCZ410-128G-G46)                      price=฿390.00
    Verify Product Suggestion Detail By Index       index=4       text=SanDisk SDCZ410-064G-G46 SanDisk USB Drive Ultra USB 30 64GB SDCZ410-064G-G46       price=฿219.00
    Verify Product Suggestion Detail By Index       index=5       text=SanDisk USB D. Ult Shift USB 3.0 64GB SDCZ410-064G-G46                              price=฿229.00
    Verify Product Suggestion Detail By Index       index=6       text=SanDisk Flash Drive SDCZ73_064G_G46                                                 price=฿275.00

UI _ Verify Search Suggestions Search By Band
    Open Web Browser
    Input Search        SANDISK
    Verify Categories Suggestions Count         4
    Verify Categorie Suggestion Detail By Index      index=1       text=in SANDISK-OI-1-30NOV21
    Verify Categorie Suggestion Detail By Index      index=2       text=in แฟลชไดร์ USB 2.0, 3.0
    Verify Categorie Suggestion Detail By Index      index=3       text=in Flash Drive
    Verify Categorie Suggestion Detail By Index      index=4       text=in IT-MEMORY-1-31JAN22
    Verify Products Suggestions Count           6
    Verify Product Suggestion Detail By Index       index=1       text=Flashdrive 32GB Blue SanDisk SDCZ73_032G_G46B           price=฿159.00
    Verify Product Suggestion Detail By Index       index=2       text=Sandisk Cruzer Blade Flash Drive 32GB (SDCZ50) Black    price=฿130.01
    Verify Product Suggestion Detail By Index       index=3       text=SanDisk FlashDrive SDCZ410_032G_G46 Black               price=฿145.00
    Verify Product Suggestion Detail By Index       index=4       text=Flashdrive SanDisk SDCZ50C                              price=฿130.00
    Verify Product Suggestion Detail By Index       index=5       text=Flashdrive SanDisk SDCZ50C                              price=฿130.00
    Verify Product Suggestion Detail By Index       index=6       text=Flashdrive SanDisk SDCZ50C                              price=฿130.00

UI _ Verify Search Suggestions Wrong Search
    Open Web Browser
    Input Search        SANDISKXX
    Verify Search Terms Suggestions Count       1
    Verify Search Terms Suggestion Detail By Index      1       sandisk
    Verify Categories Suggestions Count         4
    Verify Products Suggestions Count           6

UI _ Verify Search Suggestions Product Status On Hold
    Open Web Browser
    Input Search        SanDisk Flash Drive SDDD3_064G_G46
    Verify Product Suggestion Detail By Index       index=1       text=SanDisk Flash Drive SDDD3_064G_G46           price=฿1,000,000.00

UI _ Click Search Terms Suggestions
    Open Web Browser
    Input Search        SANDISKXX
    Verify Search Terms Suggestions Count       1
    Verify Search Terms Suggestion Detail By Index      1       sandisk
    Click Search Term By Index      1
    Wait Search Results Page
    URL Should Be Equal     https://www.officemate.co.th/en/search/sandisk

UI _ Click Categorie Suggestions
    Open Web Browser
    Input Search        SANDISKXX
    Verify Search Terms Suggestions Count       1
    Verify Search Terms Suggestion Detail By Index      1       sandisk
    Click Categorie By Name      in Memory Card
    Wait Search Results Page
    URL Should Be Equal     https://www.officemate.co.th/en/electronics-it/storage/memory-cards

UI _ Click Product Suggestions
    Open Web Browser
    Input Search        SANDISKXX
    Verify Search Terms Suggestions Count       1
    Verify Search Terms Suggestion Detail By Index      1       sandisk
    Click Product By Name      External SSD SanDisk Extreme Portable 500GB
    Wait Product Page
    URL Should Be Equal     https://www.officemate.co.th/en/seagate-%E0%B9%80%E0%B8%AD%E0%B9%87%E0%B8%81%E0%B8%8B%E0%B9%8C%E0%B9%80%E0%B8%97%E0%B8%AD%E0%B8%99%E0%B8%B1%E0%B8%A5%E0%B9%80%E0%B8%AD%E0%B8%AA%E0%B9%80%E0%B8%AD%E0%B8%AA%E0%B8%94%E0%B8%B5-sandisk-sdssde60-500g-g25-extreme-portable-500gb-ofm4007073

UI _ Click Product Status On Hold
    Open Web Browser
    Input Search        SanDisk Flash Drive SDDD3_064G_G46
    Click Product By Name      SanDisk Flash Drive SDDD3_064G_G46
    Wait Product Page
    URL Should Be Equal     https://www.officemate.co.th/en/sandisk-%E0%B9%81%E0%B8%9F%E0%B8%A5%E0%B8%8A%E0%B9%84%E0%B8%94%E0%B8%A3%E0%B9%8C%E0%B8%9F-sandisk-sddd3_064g_g46-sandisk-sddd3_064g_g46-ofmy068664

UI _ Verify Search by Full Name
    Open Web Browser
    Input Search        SANDISK Flash Drive Ultra Flair USB 3.0 SDCZ73_128G_G46
    Click Search Button
    Wait Search Results Page
    Verify Product Image Status Code 200 By Index       1
    Verify Product Name By Index        1       SANDISK Flash Drive Ultra Flair USB 3.0 SDCZ73_128G_G46
    Verify Product Serial Number By Index       1       OFMY044129
    Verify Product Price By Index       1       ฿ 850.00

API _ Check Response From API Suggestions
    [Documentation]     sandisk
    ${response}=        Request GET     url=https://www.officemate.co.th/api/search/suggest?searchQuery=sandisk&categoryId=all_categories
    Status Should Be        200     ${response}
    Verify Response Key      ${response.json()}      suggestions
    Verify Response Key      ${response.json()["suggestions"]}      categories      product_attributes      products        terms
    Verify Response Key      ${response.json()["suggestions"]["categories"][0]}      breadcrumb      count      id        level        title       url
    Verify Response Key      ${response.json()["suggestions"]["products"][0]}      brand_name      breadcrumb      count    final_price     id      image       original_price      price       sku     title       type        type_id     url

API _ Check Response From API Suggestions | Wrong Search
    [Documentation]     sandiskx
    ${response}=        Request GET     url=https://www.officemate.co.th/api/search/suggest?searchQuery=sandiskx&categoryId=all_categories
    Status Should Be        200     ${response}
    Verify Response Key      ${response.json()["suggestions"]["terms"][0]}      frequency      score      text

API _ Check Response From API Suggestions | searchQuery NULL
    [Documentation]     searchQuery is NULL
    ${response}=        Request GET     url=https://www.officemate.co.th/api/search/suggest?searchQuery=&categoryId=all_categories
    Status Should Be        200     ${response}
    Verify Response Key      ${response.json()}      suggestions
    Verify Response Key      ${response.json()["suggestions"]}      categories      product_attributes      products        terms
    Verify Response Key      ${response.json()["suggestions"]["categories"][0]}      breadcrumb      count      id        level        title       url
    Verify Response Key      ${response.json()["suggestions"]["products"][0]}      brand_name      breadcrumb      count    final_price     id      image       original_price      price       sku     title       type        type_id     url

API _ Check Response From API Suggestions | Don't Send searchQuery
    [Documentation]     Don't Send searchQuery
    ${response}=        Request GET     url=https://www.officemate.co.th/api/search/suggest?categoryId=all_categories
    Status Should Be        200     ${response}
    Verify Response Key      ${response.json()}      suggestions
    Verify Response Key      ${response.json()["suggestions"]}      categories      product_attributes      products        terms
    Verify Response Key      ${response.json()["suggestions"]["categories"][0]}      breadcrumb      count      id        level        title       url
    Verify Response Key      ${response.json()["suggestions"]["products"][0]}      brand_name      breadcrumb      count    final_price     id      image       original_price      price       sku     title       type        type_id     url

API _ Check Response From API Search
    [Documentation]     searchQuery=sandisk,limit=45,page=1,store_id=3,x_subject_id=kY1lkH4Hl2mgIjHiW94OUM3uiZans9Of,price_range=1,visibility=4
    ${response}=        Request GET     url=https://www.officemate.co.th/api/search/products?searchQuery=sandisk&limit=45&page=1&store_id=3&x_subject_id=kY1lkH4Hl2mgIjHiW94OUM3uiZans9Of&price_range=1&visibility=4
    Status Should Be        200     ${response}
    Verify Response Key      ${response.json()}      products       range
    Verify Response Key      ${response.json()["products"]}     filters     products        search_criteria     sorting     total_count
    Verify Response Key      ${response.json()["range"]}     maxPrice     minPrice

API _ Check Response From API Search | Data Not Found
    [Documentation]     searchQuery=sandiskxxx,limit=45,page=1,store_id=3,x_subject_id=kY1lkH4Hl2mgIjHiW94OUM3uiZans9Of,price_range=1,visibility=4
    ${response}=        Request GET     url=https://www.officemate.co.th/api/search/products?searchQuery=sandiskxxx&limit=45&page=1&store_id=3&x_subject_id=kY1lkH4Hl2mgIjHiW94OUM3uiZans9Of&price_range=1&visibility=4
    Status Should Be        200     ${response}
    Should be Equal       ${response.json()["range"]["minPrice"]}     ${0}
    Should be Equal       ${response.json()["range"]["maxPrice"]}     ${0}

API _ Check Response From API Search | Don't Send searchQuery
    [Documentation]     limit=45,page=1,store_id=3,x_subject_id=kY1lkH4Hl2mgIjHiW94OUM3uiZans9Of,price_range=1,visibility=4
    ${response}=        Request GET     url=https://www.officemate.co.th/api/search/products?limit=45&page=1&store_id=3&x_subject_id=kY1lkH4Hl2mgIjHiW94OUM3uiZans9Of&price_range=1&visibility=4
    Status Should Be        200     ${response}
    Verify Response Key      ${response.json()}      products       range
    Verify Response Key      ${response.json()["products"]}     filters     products        search_criteria     sorting     total_count
    Verify Response Key      ${response.json()["range"]}     maxPrice     minPrice