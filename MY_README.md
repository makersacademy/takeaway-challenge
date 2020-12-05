## Takeaway Challenge (Week 2)

### User Stories

As a customer
So that I can check if I want to order something
#### I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
#### I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
#### I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
#### I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

### Initial Action Plan
  1. Create a menu hash with dishes as keys and prices as values
  2. Create a recepit array (so that the order can be seen and checked upon purchase)
  3. Print out the menu on entry and upon request
  4. Ask for the customers dishes
  5. Ask for the dish quantity
  6. Multiply the price by the quantity to a total variable
  7. Check if order is complete after every customer dish entry
  8. Once confirmed that the order is complete:
     1. Print the recepit
     2. Print the total
  9. Get customer to confirm price
  10. Request customer name and mobile number
  11. Use TwilioAPI to send customer personalised text with delivery time (+1 hour from now)

### Commit Information
1. 1st Commit
    * Set up own README.md (MY_README.md) to document process.
    * Set up initial file structure (lib/spec files).
    * Added menu.rb and menu_spec.rb
    * Wrote menu functionality (Provided menu hash, can call open on menu to display the current items and prices).
    * TDD the menu with 100% test coverage.
  
2. 2nd Commit
    * Added receipt files (spec and lib) to use to record customer order and costs.
    * Added takeaway files (spec and lib) to provide takeaway functionality.
    * Added placeholders in receipt file to plan out what methods I want to be able to call.

3. 3rd Commit
    * Changed name of receipt to order to better reflect nature of the file.
    * Added in functionality for the following methods:
        * add_to_basket - Adds customer items to the basket with quantities provided.
        * order_summary - Print of the quantity and item for the customer.
        * order_cost - calculates the cost of all items in the basket.
        * empty_basket - deletes all items in the basket.
    * TDD all of the above methods with 100% test coverage.
    * Analysed code quality using 'rubocop' gem:
        * All checked and only offence is the use of the string print formatter to return the price to two decimal places.