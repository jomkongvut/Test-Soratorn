*** Variables ***
${SearchBoxtb}          //*[@data-testid="txt-SearchBar"]
${SearchButtonbtn}      id=btn-searchResultPage
${SuggestionsCategories}        //*[contains(@class,"suggestion_container")]
${SuggestionsCategoriesCount}       //*[contains(@class,"suggestion_container")]//*[contains(@data-suggestion-label,"categories")]
${SuggestionsProducts}       //*[@data-suggestion-productid][1]
${SuggestionsProductsCount}      //*[@data-suggestion-productid]
${SuggestionsTerms}         (//*[contains(@class,"suggestion_container")]//*[contains(@data-suggestion-label,"suggestion")])[1]
${SuggestionsTermsCount}      //*[contains(@class,"suggestion_container")]//*[contains(@data-suggestion-label,"suggestion")]







