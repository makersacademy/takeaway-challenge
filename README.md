Takeaway Challenge
==================
```
     __
      /
   .-/-.
   |'-'|
   |   |
   |   |   .-""""-.
   \___/  /' .  '. \   \|/\//
         (`-..:...-')  |`""`|
          ;-......-;   |    |
           '------'    \____/
 ```


Instructions
-------

* That's my attempt at the Takeaway Challenge!
* Below is an example of how you can run the code on IRB
* The Menu class has a default value with a few dishes, so no need to create your own
* Good luck ordering from a very bland looking menu (customers food reviews 1 out of 5 stars)

```sh
3.0.2 :001 > require "./lib/takeaway.rb"
 => true 
 
3.0.2 :003 > burger_place.show_menu
1- Beef Burger £6.0
2- Chicken Burger £5.0
4- Soft Drink £1.5
What would you like to order? => nil 

3.0.2 :004 > burger_place.add_to_order("Chicken Burger")
 => "Current total is 5.0" 

3.0.2 :005 > burger_place.add_to_order("Chips")
 => "Current total is 7.5" 

3.0.2 :007 > burger_place.add_to_order("Soft Drink")
 => "Current total is 9.0" 

3.0.2 :009 > burger_place.current_order.show_order
Chicken Burger £5.0
Chips £2.5
Soft Drink £1.5
 => "Current total is 9.0" 

3.0.2 :010 > burger_place.finalize_order
```


