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
  * Wrote feature & unit tests for Takeaway#add method that instructs the order to #add_item by providing a dish name and an optional quantity.
  * The #add method has a guard clause that checks for the respective dish to exist in the menu
  * The order is an instance of a distinct __Order__ class. Wrote feature & unit tests for this class, too. Takeaway now also initializes with an empty `order`.
  * Orders initialize with the `takeaway` that created them. They have an empty `items` hash. They have an Order#add_item method that adds an item to their items hash. Feature- & unit-tested for all these.
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
3. Story 03
  * Wrote feature & unit tests for Takeaway#order_summary and Takeaway#total methods.
  * Takeaway#order_summary instructs the order to #summarise and has a guard clause that makes sure there is something in the order to summarise.
  * Takeaway#total instructs the order to #calc_total and turns that number into a £-prefixed string even if the order is empty - no guard clause here.
  * Order#summarise generates a string by reducing `items` to a string with lines each containing a dish, its quantity and the resulting price.
  * Order#calc_total calculates a total (number) by reducing `items` to a total price that sums individual item prices (menu price * quantity)
  * PRY goes like this (with a .pryrc file that requires what's needed, adds dishes to the menu, then adds a few items to the takeaway's order):
  ```
  $ pry
  [1] pry(main)> t.order_summary
  => "Risotto con funghi porcini x3 = £12.75\n" + "Tomato and basil soup x2 = £5.9\n"
  [2] pry(main)> t.total
  => "£18.65"
  ```
  * With nothing added to the order, #order_summary raises an error, while #total is zero:
  ```
  $ pry
[1] pry(main)> t.order_summary
RuntimeError: Sorry, but you have no items in your order to summarise
from /Users/stefanliute/Projects/takeaway-challenge/lib/takeaway.rb:20:in `order_summary'
[2] pry(main)> t.total
=> "£0"
  ```
4. Story 04
  * Created __Restaurant__ class. Restaurant objects now initializes & holds the menu.
  * For simplicity's sake, there's just one restaurant that the takeaway automatically initializes. When doing so, the takeaway imports a menu from that restaurant.
  * Takeaway#pay allows the user to pay for their order by providing an amount and instructs the restaurant to #checkout_order.
  * Restaurant#checkout_order instructs the takeaway to #reset its order to empty and has a guard clause ensuring the provided amount covers the order's #calc_total.
  * Restaurant#checkout_order then sends a confirmation message via the #send_message method. For now, this simply displays the required message in IRB/PRY.
  * Takeaway#reset sets the order to a new Order object (which is, by default, empty)
  * Feature- and unit-tested for everything above. The PRY story now adds:
  ```
  $ pry
[1] pry(main)> t.pay(10)
RuntimeError: Insufficient payment! Please retry.
from /Users/stefanliute/Projects/takeaway-challenge/lib/restaurant.rb:15:in `checkout_order'
[2] pry(main)> t.pay(18.65)
=> "Thank you for your custom! Your order will be delivered before 15:51."
  ```
  * Twilio...

Issues
-----
1. Story 01:
  * At this point, the customer can add dishes to the menu if they knew they can. This is actually the restaurant manager's job. In the future, I need to make new Menu objects import their dishes from a separate file and eliminate the public #add_dish method.
2. Story 02:
  * Nothing new so far (apart from privacy).
3. Story 03:
  * Nothing new so far.
4. Story 04:
  * Restaurant#checkout_order is lazy and greedy. It will gladly take any amount above the order's total.
