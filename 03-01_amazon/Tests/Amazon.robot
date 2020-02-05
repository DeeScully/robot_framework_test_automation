*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary


*** Variables ***



*** Test Cases ***
User must sign in to check out
    [Documentation]  This is some basic info about this test
    [Tags]  Smoke
    Open Browser  https://www.amazon.com  chrome
    Wait Until Page Contains  Today's Deals
    Input Text  id=twotabsearchtextbox  Ferrari 458
    Click Button  xpath=.//span[@id='nav-search-submit-text']//following-sibling::input
    Wait Until Page Contains  results for "Ferrari 458" 
    Click Link  xpath=//*[@id="search"]/div[1]/div[2]/div/span[4]/div[1]/div[2]/div/span/div/div/div[2]/h2/a
    Wait Until Page Contains  Back to search results for "Ferrari 458"
    Click Button  css=input#add-to-cart-button
    Wait Until Page Contains  Added to Cart

    Click Link  Proceed to checkout (1 item)
    Page Should Contain Element  ap_signin1a_pagelet_title
    Element Text Should Be  ap_signin1a_pagelet_title  Amazon Sign-In
    Sleep  3s

    Close Browser

*** Keywords ***
