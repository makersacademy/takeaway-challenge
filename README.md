Makers Academy Takeaway Challenge
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

Instructions
-------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

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

I managed to complete the first three user stories but have yet to tackle the last story.

An example UI would be as follows....

Macintosh-2:takeaway-challenge lukeaveil$ irb
2.3.1 :001 > require './lib/takeaway.rb'
 => true 
2.3.1 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x007faab91bf448 @menu=#<Menu:0x007faab91bf3f8 @menu={"beef"=>6.0, "chicken"=>5.5, "veggie"=>4.0, "dessert"=>3.5}>, @order=#<Order:0x007faab91bf3d0 @order={}, @total=0, @menu=#<Menu:0x007faab91bf380 @menu={"beef"=>6.0, "chicken"=>5.5, "veggie"=>4.0, "dessert"=>3.5}>>> 
2.3.1 :003 > takeaway.add_item("dessert", 3)
 => 3 
2.3.1 :004 > takeaway.add_item("beef", 1)
 => 1 
2.3.1 :005 > takeaway.add_item("chicken", 2)
 => 2 
2.3.1 :006 > takeaway.total_price
 => "The price of your order is £27.5" 
