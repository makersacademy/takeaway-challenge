# Takeaway Challenge

## Weekend Challenge

## Week Two

##Completed on 26th February 2017
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

## Instructions

- require './lib/order' in IRB
- Create a new order `order = Order.new`
- Now we will display what is available `order.start`
- Choose from the orders listed `order.select_order("Koreanbbq", 3)`
- Get the price of the order! `order.get_price`
- Calculate the total price of your order! `order.calculate_price`

### Creating software for a Makers Academy Takeaway!
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

## Down below is an example of how the program is used.

```
pry(main)> require './lib/order'
=> true
pry(main)> order = Order.new
=> #<Order:0x007f8f6f1baa20
 @menu= #<Menu:0x007f8f6f1ba9f8
 @dishes={:Koreanbbq=>10, :Burger=>7, :KFC=>7, :Sushi=>10, :Ribs=>8}>,
 @orders=[], @prices=[], @selection={}>
pry(main)> order.start
Welcome to MA Takeaway. Please order from our tasty selection of dishes!
     Koreanbbq       £10      
       Burger       £7        
         KFC       £7         
       Sushi       £10        
        Ribs       £8         

pry(main)> order.select_order("Koreanbbq", 3)
=> "3 x Koreanbbq added to your order!"
pry(main)> order.get_price
3 x Koreanbbq at £10 each = £30
=> [{:Koreanbbq=>3}]
pry(main)> order.calculate_price
The total cost of your order is £30
The total order will be scheduled for delivery. Do you wish to continue?
=> nil
pry(main)> order.confirm("yes")
=> #<Confirmation:0x007f8f709a0798
@client= <Twilio::REST::Client @account_sid=*******, @time="22:48">
 ```

## Struggles

- To begin starting the challenge at first was tricky, as there were many options to decide how to start creating the program. This consists of using a Domain Model and implementing classes and methods into the program.

- Writing specific tests for the program, such as knowing how to test if the functionality of the API was working.

- Implementing the Twilio API was new to me, therefore I made it a mission to learn how it is incorporated into a program.

- Creating a program in the most object oriented way possible, which consisted of following the DRY and Single responsibility principle.
