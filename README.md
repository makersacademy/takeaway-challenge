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

Introduction
-------

Weekend challenge for second week at Makers Academy.  The task was to writ a Takeaway program to satisfy the following user stories:

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

In IRB
-------

2.3.1 :001 > require './lib/takeout'  
 => true  
2.3.1 :002 > takeout = Takeout.new('ratties_picnic.csv')  
=> #<Takeout:0x007fbfe1b59f48 @menu=#<Menu:0x007fbfe1b59f20 @dishes={1=>#<Dish:0x007fbfe1b59908 @name="Cold chicken", @price=1.5>, 2=>#<Dish:0x007fbfe1b597a0 @name="Cold tongue", @price=1.5>, 3=>#<Dish:0x007fbfe1b596b0 @name="Cold ham", @price=1.9>}>, @previous_orders={}>
2.3.1 :003 > takeout.menu
=> #<Menu:0x007fbfe1b59f20 @dishes={1=>#<Dish:0x007fbfe1b59908 @name="Cold chicken", @price=1.5>, 2=>#<Dish:0x007fbfe1b597a0 @name="Cold tongue", @price=1.5>, 3=>#<Dish:0x007fbfe1b596b0 @name="Cold ham", @price=1.9>}>  
2.3.1 :004 > takeout.order(2)
=> 1.5
2.3.1 :005 > takeout.order(1)
=> 3.0
2.3.1 :006 > takeout.my_order
=> #<Order:0x007fbfe1bab618 @dishes=[#<Dish:0x007fbfe1b597a0 @name="Cold tongue", @price=1.5>, #<Dish:0x007fbfe1b59908 @name="Cold chicken", @price=1.5>], @total=3.0>
2.3.1 :007 > takeout.total
=> 3.0
2.3.1 :008 > takeout.pay(3)

and so on!
