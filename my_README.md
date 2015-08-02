
You will need a free Twilio account:

  Enter the AUTH_SID & AUTH_TOKEN in the takeaway-challenge/lib/restaurant.rb file

To create a new restaurant (menu provided):
```
  restaurant_name = restaurant.new
```
To create a new customer account:

  customer_name =  customer.new( name_string, phone_number_string)

  by default, name = "Piers" & phone_number = "+447736409366"

To select a restaurant for the customer to create from:

  customer_name.select_restaurant restaurant_name

Customer commands:

  customer_name.
                request_menu
                create_order
                update_order food_item, quantity
                submit_order


User Stories:


Remaining questions:
- How to make phone number secret using environment variables?
- How to mix-in the twilio-ruby gem without breaking Dependency Inversion Principle?
