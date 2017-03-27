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

Write a Takeaway program with the following user stories:

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
My Approach
-----------

My approach to this challenge consists in creating a takeaway as a main hub that imports a menu. The takeaway can be a restaurant that potentially has a selection of menus to choose from, and the user can view any of these menus.

The client can place orders, select a custom amount of available dishes and receive information of order status. The client then can progress to checkout where the total of the order will be calculated. 

When completing the order, the client receives a text message confirming order with a total. 

Instructions to run, type in Pry or Irb:  
  
```
[1] pry(main)> require "./lib/takeaway"
[2] pry(main)> feedme = Takeaway.new
=> #<Takeaway:0x007fef7f178740 @orders=[]>
[3] feedme.view_menu
=> {"Dim sum"=>2, "Fried rice"=>3, "Crispy chicken"=>4, "Pepper squid"=>5}
[4] feedme.place_order("Dim sum", 3)
=> 3x Dim sum added to basket
=> [{:dish_name=>"Dim sum", :price=>2, :amount=>3}]
[5] pry(main)> feedme.place_order("Dim sum", 3)
=> 3x Dim sum added to basket
=> [{:dish_name=>"Dim sum", :price=>2, :amount=>3}, {:dish_name=>"Dim sum", :price=>2, :amount=>3}]
[6] pry(main)> feedme.checkout
=> Your total is £24
=> [{:dish_name=>"Dim sum", :price=>2, :amount=>3}, {:dish_name=>"Dim sum", :price=>2, :amount=>3}]
[7] pry(main)> feedme.complete_order
```
>The client will receive a message, confirming order and the total
