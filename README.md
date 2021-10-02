Takeaway Challenge 🍕 
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

How to use
-------

* Run IRB from the lib file with the following commands: `require "./takeaway.rb"` + `require "./menu.rb"` 

Task
-----
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
My process
-------
Class | Methods
------------ | -------------
Takeaway | view_menu, add(dish), check_total
Menu | print
Order | calculate_total
Message | send_message


- I was able to complete the first three user stories with 100% coverage with 0 offenses on RuboCop
- As seen in the table above, I intended to create an 'Order' class which would contain the calculate_total method. Unfortunately after trying several times to do this, I wasn't able to get all the classes communicating properly, so I need to spend more time learning about dependency injection and how to implement the core concepts of OOD in my code.

