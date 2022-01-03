## Takeaway Challenge

```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

### The Challenge

This is the second weekend challenge of the Makers Academy bootcamp. The challenge was to write a takeaway program that met 
the following user stories:

```As a customer
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
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" 
after I have ordered
```

The text-sending functionality was to be implemented using the Twilio API.

### Functionality

With my program, the user can:-
- Load a bespoke menu from a .txt file (assuming it's formatted correctly)
- See a list of dishes and their prices
- Order one or more of a dish from the menu
- Remove one or more of a dish from the order
- View their order including the total price
- Check that the price they've been given matches the total price of the order
- Receive a text upon completing the order letting them know when they'll receive their food

Below is an example of how the app might be used from a user's perspective (edited slightly for brevity)

```3.0.2 :001 > require './lib/takeaway'
3.0.2 :002 > cafe = Takeaway.new(Menu.new('./lib/cafe.txt'))
 => 
#<Takeaway:0x0000000143be1ee8
... 
1. Dippy Eggs and Soldiers - £4.5
2. Crumpets and Jam - £3.5
3. Chip Butty - £4.0
5. Eggy Bread - £3.5
6. Delicious Coffee - £2.0
...
3.0.2 :004 > cafe.order_food(1, 2)
 => 9.0 
3.0.2 :005 > cafe.order_food(6, 60)
 => 129.0 
3.0.2 :006 > cafe.display_order
2 x Dippy Eggs and Soldiers - £9.0
60 x Delicious Coffee - £120.0
Total cost: £129.0
 => nil 
3.0.2 :007 > cafe.remove_food(6, 58)
...
3.0.2 :008 > cafe.display_order
2 x Dippy Eggs and Soldiers - £9.0
2 x Delicious Coffee - £4.0
Total cost: £13.0
 => nil 
3.0.2 :009 > cafe.order_correct?
 => true 
3.0.2 :010 > cafe.complete_order
 => <Twilio.Api.V2010.MessageInstance body: Sent from your Twilio trial account - Thanks for your order! Your food will be with you at 12:11 AM....>
```
 ### Things I'd like to improve

 - I don't think the code is very elegant, particularly the relationship between Order and Takeaway
 - I've tried to account for edge cases but don't feel like I've caught them all
 - I haven't managed 100% test coverage
 - I didn't get around to having a go at implementing the ability to order via text
 - I tried to use Webmock to stub out Twilio and failed
