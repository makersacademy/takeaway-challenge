Takeaway Challenge
==================

**USER STORIES & KEY OBJECTS**
-------
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
* `TakeAway`
  * `#show_menu`
  * `@menu` (Menu class object)

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
* `TakeAway`
  * `#start_order`
  * `@curr_order` (Order class object)

* `Order`
  * `#add_item`, `#add_basket` (private)
  * `@menu` (Menu class object), `@item` (hash), `@basket` (array)

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
* `Order`
  * `#check_basket`, `#calc_total` (private)
  * `@total`

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
* `SMS`
  * `#send_sms`

* `TakeAway`
  * `#complete_order`
  * `#send_confirmation`
  * `#customer_payment` (private)
  * `@delivery_eta`

**INSTRUCTIONS**
-------
1. Create a new TakeAway object. This will automatically create a Menu object `@menu`.
2. View the menu using `#show_menu`. It will be `p`'d in the Terminal
3. Start a new order using `#start_order`. This will create a new Order object `@curr_order`
4. Add items to your current order/basket using the `#add_item` method. `#add_item` takes two arguments:
  * `dish` - the menu item; enter as a string; case insensitive.
  * `quantity` - the number of the dish that you want; default to 1 if no number entered
  This method will populate the `@item` hash (consisting of 3 keys `:dish`, `:quantity` and `:subtotal`). the private `#add_basket` method will then be called to push a duplicate of this hash into the `@basket` array. A string will then be `puts`d to confirm what has been added.
5. Check your basket using `#check_basket`. It will list all items you have added to the basket along with the subtotal for those items and the grand total.
6. Complete your order using `#complete_order`. It takes one argument:
  * `amount` - the amount you, as the customer, are paying
  If you pay the exact correct amount, you will receive a confirmation message followed by a text.
  If you pay the incorrect amount, you will receive an error message.

**EXAMPLE CODE**
-------
You can copy and paste the following code into Terminal to run the program's basic functions. Note that the SMS functionality will not work for anyone other than the original developer (Julian) as the credentials have been set to be Environmental Variables which are not publically available.
``` Ruby
  ta = TakeAway.new
  ta.show_menu
  ta.start_order

  ta.curr_order.add_item("egg fried rice", 1)
  ta.curr_order.add_item("SWEET & SOUR CHICKEN", 2)
  ta.curr_order.add_item("Crispy Duck")
  ta.curr_order.check_basket

  ta.complete_order(27.10)
```
