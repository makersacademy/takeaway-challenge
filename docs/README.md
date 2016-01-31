Takeaway Challenge
==================

Approach
-------
The takeaway contains four classes: Takeaway, Menu, Order and Text. Takeaway is responsible for handling orders. Menu is self-explanatory. Text uses twilio-ruby to send a confirmation text/sms that the order will be dispatched in one hour. Order is responsible for building the order.

Order class: the customer can add the dishes and how many they want to have of each, see their current selection and how much it will cost.

Takeaway class: Setting up the restaurant menu and the sms service. It allows customers to create multiple orders and to place them with the takeaway. Confirmation is sent by sms.   


User stories to solve
-------
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

Installation
-------
```
1. Git clone the repository
2. Gem install bundle
3. Bundle install
```

To receive the SMS messages you will have to make a (free) Twilio account and then set up three environment variables: ACCOUNTSID= Your Twilio Account SID.
AUTHTOKEN= Your Twilio Auth Token.
MYPHONE= A verified phone number to receive the messages.
You can set these globally or just in the file .env in the project root.

Usage
-------
```
[2] pry(main)> pub = Takeaway.new(Order,Menu.new,Text.new)
=> #<Takeaway:0x007fa68a541f40
 @menu=
  #<Menu:0x007fa68a542d28
   @dishes=
    {:name=>"price",
     :vegetable_soup=>5.5,...........

[3] pry(main)> puts pub
name....................£price
vegetable_soup............£5.5
ham_hock..................£7.0
gravalax..................£7.5
stilton_pie..............£13.5
duck_confit..............£16.0
italian_sausage..........£13.5
fish_n_chips.............£13.5
sea_bass.................£16.0
cheeseburger.............£12.5
apple_crumble.............£6.5
chocoloate_brownie........£6.5

[5] pry(main)> my_order = pub.new_order
=> #<Order:0x007fa68a3918d0

[10] pry(main)> my_order.add(:ham_hock)
=> [[1, :ham_hock, 7.0]]

[11] pry(main)> my_order.add(:gravalax,2)
=> [[1, :ham_hock, 7.0], [2, :gravalax, 7.5]]

[12] pry(main)> my_order.show_sum
=> 22.0

[13] pry(main)> my_order.show_selection
=> ["Total sum for order is: £22.0", [[1, :ham_hock, 7.0], [2, :gravalax, 7.5]]]

[14] pry(main)> pub.place(my_order,17)
RuntimeError: Incorrect value - should be £22.0
from /Users/eirikwiig/Projects/Course/Week2/takeaway-challenge/lib/takeaway.rb:25:in `place'

[15] pry(main)> pub.place(my_order,22)
=> <Twilio::REST::Message....
