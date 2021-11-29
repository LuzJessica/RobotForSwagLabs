*** Settings ***

Library  SeleniumLibrary

*** Variables ***

${URL}                            https://www.saucedemo.com/
${USERNAME}                       standard_user
${PASSWORD}                       secret_sauce
${FILTER_OPTIONS}                 Name (A to Z)\nName (Z to A)\nPrice (low to high)\nPrice (high to low)
@{MANDATORY_FIELDS_TO_CHECKOUT}   Jessica  Luz  37517000

*** Keywords ***

### SETUP AND TEARDOWN###

Open Website
  Open Browser  about:blank  chrome

Close Website
  Close Browser

Given than user access the Swag Labs website
  Go To  ${URL}
  Title Should Be    Swag Labs
  Element Should Be Visible    id=login-button

When user informs username and password
  Input Text    id=user-name    ${USERNAME}
  Input Text    id=password     ${PASSWORD}

And click Login button
  Click Button    id=login-button

Then the page of products should be load
  Element Text Should Be    xpath=//span[@class='title']    PRODUCTS

And click the menu button
  Click Button    id=react-burger-menu-btn

Then the menu items shoud apper
  Element Should Be Enabled    css=.bm-menu

And then in the X menu button
  Wait Until Element Is Visible    id=inventory_sidebar_link
  Click Element    css=.bm-cross-button

And then click in the "About" item in the menu list
  Wait Until Element Is Visible    id=inventory_sidebar_link
  Click Element    id=about_sidebar_link

Then the Sauce Labs website should load
  Title Should Be    Cross Browser Testing, Selenium Testing, Mobile Testing | Sauce Labs

And then click in the "Logout" item in the menu list
  Wait Until Element Is Visible    id=inventory_sidebar_link
  Click Element  id=logout_sidebar_link

Then the Login page should load
   Title Should Be    Swag Labs
   Element Should Be Visible    id=user-name
   Element Should Be Visible    id=password

And click in the button NAME(A TO Z)
   Click Element    css=.product_sort_container

Then the options Name (A TO Z), Name (Z TO A), Price (low to high), Price (high to low) should be shown
  Element Should Contain    css=.product_sort_container    ${FILTER_OPTIONS}

And click in the button "ADD TO CART" of "Sauce Labs Backpack"
  Click Button    id=add-to-cart-sauce-labs-backpack

Then the button text should change to REMOVE
  Element Text Should Be    id=remove-sauce-labs-backpack    REMOVE

And the number 1 should apper in the cart
  Element Text Should Be    css=span.shopping_cart_badge    1

And click in the cart item
  Click Element    css=a.shopping_cart_link

Then the page of checkout should open
  Element Text Should Be    css=span.title    YOUR CART

And click in the button "REMOVE" from item in the cart page
  Click Button    id=remove-sauce-labs-backpack

Then the item should desappear from cart
  Element Should Not Be Visible    css=div.cart_quantity

And click in the button "CHECKOUT"
  Click Button    id=checkout

Then the checkout information page should load
  Element Text Should Be    css=span.title    CHECKOUT: YOUR INFORMATION

And inform First Name, Last Name and Zip Code
  Input Text    id=first-name    ${MANDATORY_FIELDS_TO_CHECKOUT[0]}
  Input Text    id=last-name     ${MANDATORY_FIELDS_TO_CHECKOUT[1]}
  Input Text    id=postal-code   ${MANDATORY_FIELDS_TO_CHECKOUT[2]}

And click in the button "CONTINUE"
  Click Button    id=continue

Then the page Checkout: overview should load
  Element Text Should Be       css=span.title  CHECKOUT: OVERVIEW
  Element Text Should Be       css=div.summary_info_label    Payment Information:
  Element Should Be Visible    css=div.summary_total_label

And Last Name and Zip Code
  Input Text    id=last-name     ${MANDATORY_FIELDS_TO_CHECKOUT[1]}
  Input Text    id=postal-code   ${MANDATORY_FIELDS_TO_CHECKOUT[2]}

Then the message "Error: First Name is required" shoud appears in the continue button
  Element Text Should Be    css=h3[data-test='error']    Error: First Name is required
