*** Setting ***

Resource  ../resources/Resource.robot
Test Setup  Open Website
Test Teardown  Close Website

*** Test Cases ***

Test Case 1: Sign in
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  Then the page of products should be load


Test Case 2: Acess items menu
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  And click the menu button
  Then the menu items shoud apper

Test Case 3: Close items menu
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  And click the menu button
  And then in the X menu button

Test Case 4: Open About page
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  And click the menu button
  And then click in the "About" item in the menu list
  Then the Sauce Labs website should load

Test Case 5: Click Logout menu item
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  And click the menu button
  And then click in the "Logout" item in the menu list
  Then the Login page should load

Test Case 6: Show Name filter options
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  And click in the button NAME(A TO Z)
  Then the options Name (A TO Z), Name (Z TO A), Price (low to high), Price (high to low) should be shown

Test Case 7: Add Item to cart
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  And click in the button "ADD TO CART" of "Sauce Labs Backpack"
  Then the button text should change to REMOVE
  And the number 1 should apper in the cart

Test Case 8: Check cart items
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  And click in the button "ADD TO CART" of "Sauce Labs Backpack"
  And click in the cart item
  Then the page of checkout should open

Test Case 9: Remove item from cart
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  And click in the button "ADD TO CART" of "Sauce Labs Backpack"
  And click in the cart item
  And click in the button "REMOVE" from item in the cart page
  Then the item should desappear from cart

Test Case 10: Proceed to checkout
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  And click in the button "ADD TO CART" of "Sauce Labs Backpack"
  And click in the cart item
  And click in the button "CHECKOUT"
  Then the checkout information page should load

Test Case 11: Informing mandatory datas for checkout
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  And click in the button "ADD TO CART" of "Sauce Labs Backpack"
  And click in the cart item
  And click in the button "CHECKOUT"
  And inform First Name, Last Name and Zip Code
  And click in the button "CONTINUE"
  Then the page Checkout: overview should load

Test Case 12: Not Informing First Name for checkout
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  And click in the button "ADD TO CART" of "Sauce Labs Backpack"
  And click in the cart item
  And click in the button "CHECKOUT"
  And Last Name and Zip Code
  And click in the button "CONTINUE"
  Then the message "Error: First Name is required" shoud appears in the continue button
