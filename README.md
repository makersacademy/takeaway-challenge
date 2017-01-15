Takeaway Challenge
==================

User Stories
-------------

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

Instructions
-------------

To create a menu, add dishes to the dishes.txt in the format: ```meal_name 995``` with price in pennies.

To set-up confirmation texts, create a client_details.rb file in the lib folder and the following to it with your details:
```
module ClientDetails
    def client_details
        client_details = {
            account_sid: 
            auth_token: 
            from: 
            to: 
            body: "Thanks for your order! Expect delivery before %s"
        }
        client_details
    end
end
```
Below is a copy from irb, showing how to use the program:
```
2.3.1 :001 > require './lib/restaurant'
 => true 
2.3.1 :002 > take_away = Restaurant.new
2.3.1 :003 > take_away.show_menu
 => "Lamb Rogan Josh £9.25, Chicken Madras £8.95."
 2.3.1 :006 > take_away.take_order("Big Mac 10")
RuntimeError: Big Mac is not on the menu
 2.3.1 :005 > take_away.take_order("lamb rogan josh 2, Chicken madras 1")                                                                                                                                                                       
 => "Your order total is: £27.45"
 ```
Order should be inputted as a string: "first choice quantity, second choice quantity, etc"

Once the order has been passed you will receive a text giving you an estimated delivery time.

Edge Cases and further development
--------------------------------------

Given more time, there'd be a couple more features I'd like to implement.

* A way to pass in multiple orders, and then using a confirm_order method to pass it
* Instead of overwriting orders, increase the quantity when passed in again
* Presenting a list of options for possible misspelt orders