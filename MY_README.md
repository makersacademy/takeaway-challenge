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

User Stories
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


Classes and Methods
-------
Menu
  #display
    should display the menu
    should display a list of dishes and prices 

Takeaway
  #view_menu
    should display the menu
  #select_dish
    should add a dish to the basket
  #total
    should calculate the total of the order
  #place_order
    should raise an error if the amount is incorrect
    should send a confirmation text

Feature Test
-------
$ irb -r './lib/takeaway.rb'
2.6.5 :001 > takeaway = Takeaway.new
 => #<Takeaway:0x00007fae7398a9d0 @menu=#<Menu:0x00007fae7398a9a8 @menu={"Sushi"=>5, "Curry"=>6, "Egg roll"=>2, "Soup"=>1}>, @basket={}, @sum=0> 
2.6.5 :002 > takeaway.view_menu
"Sushi: £5"
"Curry: £6"
"Egg roll: £2"
"Soup: £1"
 => {"Sushi"=>5, "Curry"=>6, "Egg roll"=>2, "Soup"=>1} 
2.6.5 :003 > takeaway.select_dish("Sushi", 3)
 => 3 
2.6.5 :004 > takeaway.select_dish("Curry", 1)
 => 1 
2.6.5 :005 > takeaway.select_dish("Soup", 2)
 => 2 
2.6.5 :006 > takeaway.total
"Total is £23"
 => "Total is £23" 
2.6.5 :007 > takeaway.view_basket
"Sushix3"
"Curryx1"
"Soupx2"
"Total:£23"
 => "Total:£23" 
2.6.5 :008 > takeaway.place_order
