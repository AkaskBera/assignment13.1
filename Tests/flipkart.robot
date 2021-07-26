*** Settings ***
Library    SeleniumLibrary
Resource    ../Utilities/commonUtil.robot
Resource    ../Utilities/locators.robot

Suite Setup  User is allowed to open Flipkart
Suite Teardown  Close my Browser

#Robot -d report -i demo  flipkart.robot
*** Test Cases ***
Select your desire device of any electronics accessories and Add to Cart.
    [Tags]  demo
    #Given User is allowed to open Flipkart
    And Login with a valid mobile number
    When User navigates to electronics section
    And User selects the desired device and clicks on add to cart
    And User navigated to cart and verify if item is added or not

*** Keywords ***
User is allowed to open Flipkart
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

Login with a valid mobile number
    Input Text  ${mob_elem}  ${mob}
    Input Password  ${pwd_elem}  ${pwd}
    Click Button  Login

User navigates to electronics section
    Sleep   5s
    Click Element  ${ect_elem}
    Page Should Contain  Electronics

User selects the desired device and clicks on add to cart
    Input Text  ${search_bar}  ${search_item}
    Press Keys  ${search_bar}  ENTER
    Wait Until Page Contains Element  ${item_elem}  timeout=20s
    Click Element  ${item_elem}
    Switch Window  new
    Click Element  ${add_to_cart}
    
User navigated to cart and verify if item is added or not
    Switch Window  main
    Click Element  ${cart_elem}
    Page Should Contain  Redmi Note 6 Pro (Blue, 64 GB)

Close my Browser
    Close Browser
