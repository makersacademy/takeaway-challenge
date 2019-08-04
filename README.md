Takeaway Challenge
==================

#### *This program is a ruby representation of a basic takeaway application*

___••Installation instructions••___
- Run `bundle install`
- To enable the text functionality of the program you will need to register a free account on twilio and create a phone number
- Set up environment variables
    - Edit your bash_profile file as below.
    - Make sure to make a copy before making any changes to your bash_profile file.
    ```bash
    $ export TWILIO_SID="Your Account SID here"
    $ export TWILIO_AUTH_TOKEN="Your Auth token here"
    $ export TWILIO_PHONE="Your twilio phone number here"
    $ export PHONE_NUMBER="Your phone number here"
    ```

## User-spec fulfilment
```ruby
takeaway = Takeaway.new
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
puts takeaway.view_menu


# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
takeaway.menu_select('pepperoni', 3)
takeaway.menu_select('hawaiian', 1)


# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
puts takeaway.view_basket
puts takeaway.view_total_price

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
takeaway.make_payment(42)
```

## How to use

__**IRB**__
```ruby
2.5.0 :001 > require './lib/takeaway.rb'
 => true
2.5.0 :002 > t = Takeaway.new
 => #<Takeaway:0x00007ffe058d4d38 @order=#<Order:0x00007ffe058d4d10 @basket=[], @total_price=0>, @menu=#<Menu:0x00007ffe058d4cc0 @menu_list={"pepperoni"=>10, "hawaiian"=>12, "meat feast"=>15, "vegetarian"=>9, "spicy sausage"=>11, "awesome sauce"=>0.59}>, @text_message=#<ConfirmationText:0x00007ffe058d4c48>>
2.5.0 :003 > t.view_menu
 => {"pepperoni"=>10, "hawaiian"=>12, "meat feast"=>15, "vegetarian"=>9, "spicy sausage"=>11, "awesome sauce"=>0.59}
2.5.0 :004 > t.menu_select 'pepperoni'
 => "1x pepperoni added to your basket"
2.5.0 :005 > t.menu_select 'spicy sausage', 2
 => "2x spicy sausage added to your basket"
2.5.0 :006 > t.view_basket
 => ["pepperoni = £10", "spicy sausage = £11", "spicy sausage = £11"]
2.5.0 :007 > t.view_total_price
 => "Total  = £32"
2.5.0 :008 > t.make_payment(32)
 => "Thank you for your order, you should receive a confirmation text message soon"
2.5.0 :009 >
A text message will be sent, confirming the time of arrival as one hour from the order time.
```
