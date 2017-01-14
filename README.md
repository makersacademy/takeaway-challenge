Takeaway Challenge
==================

Task
-----

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

Progress
-----

1. Story 01:
  * Wrote feature & unit tests for __Takeaway__ class whose objects #initialize with a `menu`.
  * Made the menu an instance of a distinct __Menu__ class. Wrote feature & unit tests for this class, too.
  * The menus #initialize with an empty `dishes` array. The user can manually #add_dish by providing a name (string) and a price (number), in this order.
  * Here's how the story unfolds in IRB now:
```
$ irb -r './lib/takeaway.rb'
 :001 > t = Takeaway.new
 => #<Takeaway:0x007f8528849a40 @menu=#<Menu:0x007f8528849900 @dishes={}>>
 :002 > t.menu.add_dish("Risotto con funghi porcini", 4.25)
 => 4.25
 :003 > t.menu.add_dish("Tomato and basil soup", 2.95)
 => 2.95
 :004 > t.menu.add_dish("Pizza Margherita", 5.30)
 => 5.3
 :005 > puts t.menu
{"Risotto con funghi porcini"=>4.25, "Tomato and basil soup"=>2.95, "Pizza Margherita"=>5.3}
 => nil
```
2. Story 02:




Issues
-----
1. Story 01:
  * At this point, the user can add dishes to the menu if they knew they can. This is actually the restaurant manager's job. In the future, I need to make new Menu objects import their dishes from a separate file and maybe eliminate the public #add_dish method.
2. Story 02:
