Takeaway Challenge
==================

This program can be used in two ways, either in a [REPL](#repl) or using [text messages](#text-messages). First, clone the repo and run 'bundle' to install all required gems. You need to sign up for Twilio to be able to use the API needed here. This program is comprised of three classes:

- Takeaway: This holds the menu and handles receiving and confirmation of the order
- Billing: This handles the calculation of the order's total
- Text: This handles the sending of text messages 

<a name="repl">Using a REPL</a>
-------
When you're in the project directory, run your REPL and require takeaway.rb and create and instance of it

``` 
[1] pry(main)> require './lib/takeaway'
=> true
[2] pry(main)> takeaway = Takeaway.new
=> #<Takeaway:0x007f8366a515b8
 @billing=#<Billing:0x007f8366a51568>,
 @menu=
  [{:name=>"Bolognese", :price=>6},
   {:name=>"Pizza", :price=>8},
   {:name=>"Chips", :price=>2},
   {:name=>"Chicken", :price=>3},
   {:name=>"Hamburger", :price=>4},
   {:name=>"Donner Wrap", :price=>6},
   {:name=>"Nuggets", :price=>3},
   {:name=>"Mozzarella Sticks", :price=>5},
   {:name=>"Deep-fried Mars Bar", :price=>1},
   {:name=>"Fish", :price=>5}],
 @order=[{:total=>0}],
 @text=#<Text:0x007f8366a51590>>
```
We can see a menu with some food items and their prices.
The `parse_order` method of the `Takeaway` class takes a string in the format `(quantity foodname, quantity foodname, quantity foodname)` and creates an array with the selected items, their quantities and the total price, which is accessible through `@order`.

For example if we pass in
```
[3] pry(main)> takeaway.parse_order('2 nuggets, 4 chicken, 3 chips')
```
We can access our current order as such
```
[4] pry(main)> takeaway.order
=> [{:total=>24},
 {:name=>"Nuggets", :price=>3, :quantity=>2},
 {:name=>"Chicken", :price=>3, :quantity=>4},
 {:name=>"Chips", :price=>2, :quantity=>3}]
```
`check_sum` checks if the total of the order matches the sum of all the chosen food items
```
[5] pry(main)> takeaway.check_sum
=> true
```
Finally, `confirm_order` will send a text message to the verified recipient designated in the `Text` class
```
[6] pry(main)> takeaway.confirm_order
```
For example, the text would read
```
Your order total is 34 and you will it receive it no later than 23:50. Thank you!
```
<a name="text-messages">Using text messages</a>
-------
This involves a few more steps, namely using [ngork](https://ngrok.com/) to expose a local server that the Twilio API can hook onto and Sinatra to receive post requests.

First, install download and install ngork. Then run
```
./ngrok http 4567
```
When ngrok runs, you get a randomly generated URI, such as https://42a3b352.ngrok.io which must be entered into the Twilio console for your Twilio number to receive texts. You also have to append /sms to the URI you submit to TWilio.

Then, in the project directory run
```
ruby app.rb
```
Now the app is listening for texts. You can text the word 'menu' to receive a menu and you can text an order in the same format that the above `parse_order` takes an argument, and you will receive a text in the same format as above.

Example of this in use:

![gif](https://thumbs.gfycat.com/CostlyDeafeningJohndory-size_restricted.gif)