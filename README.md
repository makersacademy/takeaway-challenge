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



Setup
-----

* Run the command 'bundle' in the project directory to ensure you have all the gems


```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices


menu = Menu.new
menu.show_menu



As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes


order = Order.new
order.add("pork", 7)
order.add("duck", 2)
order.add("chicken", 6)



As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

order = Order.new
order.add("pork", 7)
order.add("chicken", 6)
total = Total.new(order)
total.show_total

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

order = Order.new
order.add("pork", 7)
order.add("chicken", 6)
total = Total.new(order)
total.show_total
send_sms

```
