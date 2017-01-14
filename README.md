Takeaway Challenge ![Travis build status](https://travis-ci.org/sliute/takeaway-challenge.svg?branch=master)
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
  * Menus #initialize with an empty `dishes` array. The user can manually #add_dish by providing a name (string) and a price (number), in this order. This is a temporary solution (meant just for the restaurant manager's use, not for the customer's) before I make menus import their dishes from an external file.
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
  * Wrote feature & unit tests for Takeaway#add method that adds an item to the order by providing a dish name and an optional quantity.
  * The #add method calls a private #add_to_order method, which adds it to the order but has a guard clause that checks for the respective dish to exist in the menu
  * The order is an instance of a distinct __Order__ class. Wrote feature & unit tests for this class, too. Takeaway now also initializes with an empty `order`.
  * Orders initialize with the `takeaway` that created them. They have an empty `items` hash. They also have an Order#add_item method that adds an item to their items hash.
  * The story in PRY (with a .pryrc file that requires all necessary files and adds the same items to the menu) is now:
  ```
  $ pry
  [1] pry(main)> t.menu
  => #<Menu:0x007fbf69a50840
   @dishes={"Risotto con funghi porcini"=>4.25, "Tomato and basil soup"=>2.95, "Pizza Margherita"=>5.3}>
  [2] pry(main)> t.add("Risotto con funghi porcini", 2)
  "You added 2 Risotto con funghi porcini(s) to your order."
  => "You added 2 Risotto con funghi porcini(s) to your order."
  [3] pry(main)> t.add("Farfale", 3)
  RuntimeError: Sorry, we don't have Farfale in our menu.
  from /Users/stefanliute/Projects/takeaway-challenge/lib/takeaway.rb:20:in `add_to_order'
  [4] pry(main)>
  ```


Issues
-----
1. Story 01:
  * At this point, the customer can add dishes to the menu if they knew they can. This is actually the restaurant manager's job. In the future, I need to make new Menu objects import their dishes from a separate file and eliminate the public #add_dish method.
2. Story 02:
  * nothing I can see so far.
