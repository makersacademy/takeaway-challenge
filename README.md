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

Task
-----
Write a program that successfully implements the following user stories.

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

How to Use
-------

```
Amandas-MacBook-Pro:takeaway-challenge amanda$ pry
😺 require './lib/takeaway.rb'
=> true
😺 takeaway = Takeaway.new
=> #<Takeaway:0x007fec53804c78 @items={}, @menu=#<Menu:0x007fec53804c50>>
😺 takeaway.add_item('pepperoni')
=> 1
😺 takeaway.add_item('chips', 2)
=> 2
😺 takeaway.add_item('garlic bread')
=> 1
😺 takeaway.add_item('coca-cola')
=> 1
😺 takeaway.items
=> {"pepperoni"=>1, "chips"=>2, "garlic bread"=>1, "coca-cola"=>1}
😺 takeaway.show_total
=> 21
😺 takeaway.pay(21)
Your order has been received and you will receive a text confirmation shortly
=> nil
😺
```
