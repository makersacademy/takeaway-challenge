Takeaway Challenge
==================
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

### User Stories
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
-------

1. Fork this repo, and clone to your local machine. Navigate into the folder.
2. Run the command gem install bundle (if you don't have bundle already)
3. When the installation completes, run bundle

## Example Commands
```
order = Order.new
order.view_menu
order.add(dish, quantity)
order.view_basket
order.place(total)
```
## Running the code in irb
```
irb
2.6.5 :001 > require './lib/order'
 => true
2.6.5 :002 > order = Order.new
 => #<Order:0x00007fa05da8f228 @menu=#<Menu:0x00007fa05da8f200>, @basket=#<Basket:0x00007fa05da8f1d8 @basket=[], @subtotal=0, @menu=#<Menu:0x00007fa05da8f1b0>>, @orderconfirmation=#<OrderConfirmation:0x00007fa05da8f160>>
2.6.5 :003 > order.view_menu
  burger 10.0
 cheese burger 11.0
 chicken burger 11.0
 seitan burger 12.5
 fries 4.0
 chunky chips 4.5
 coleslaw 3.0
 chicken wings 6.5
 cola 2.5
 fanta 2.5
 => nil
2.6.5 :004 > order.add("burger", 2)
 => "2 burgers added to basket"
2.6.5 :005 > order.add("fries", 3)
 => "3 fries added to basket"
2.6.5 :006 > order.add("cola", 1)
 => "1 cola added to basket"
2.6.5 :007 > order.view_basket
2 x burger @ 10.0: 20.0
 3 x fries @ 4.0: 12.0
 1 x cola @ 2.5: 2.5
 => 34.5
2.6.5 :008 > order.checkout(34.5)
SM656a809917944a60a9084db96fb8a504
 ```
