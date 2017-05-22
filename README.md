# Takeaway Challenge
## Makers Academy Week 2 Weekend Challenge

### What it Does
Emulates an online takeaway food ordering system.

### How to Use
Run in IRB.
```
2.4.0 :001 > require './lib/restaurant.rb'
 => true
```
Make a restaurant!
```
2.4.0 :002 > japanese_restaurant = Restaurant.new
 => #<Restaurant:0x007fe580199890 @menu=#<Menu:0x007fe580199868 @dishes=[{"edemame"=>5.0}, {"chirashi"=>11.95}, {"salmon nigiri"=>5.5}, {"california rolls"=>6.75}, {"miso soup"=>2.0}, {"dorayaki"=>3.5}, {"mochi"=>3.5}], @basket=[]>, @order=#<Order:0x007fe5801996b0 @current_order=[], @order_total=nil>>
```
Look at the fairly readable menu!
```
2.4.0 :003 > japanese_restaurant.menu.show_menu
edemame, 5.0
chirashi, 11.95
salmon nigiri, 5.5
california rolls, 6.75
miso soup, 2.0
dorayaki, 3.5
mochi, 3.5
```
Let's order food! (via the list number and then quantity desired)
```
2.4.0 :005 > japanese_restaurant.menu.order_item(1,1)
 => "You added 1 portions of edemame to your basket!"
```
ORDER LOTS OF FOOD
```
2.4.0 :006 > japanese_restaurant.menu.order_item(2, 2)
 => "You added 2 portions of chirashi to your basket!"
2.4.0 :007 > japanese_restaurant.menu.order_item(5, 1)
 => "You added 1 portions of miso soup to your basket!"
2.4.0 :008 > japanese_restaurant.menu.order_item(7, 2)
 => "You added 2 portions of mochi to your basket!"
 ```
Finish the order!
```
2.4.0 :009 > japanese_restaurant.checkout
 => "Your chosen items have been moved to your order!"
2.4.0 :010 > japanese_restaurant.order.get_total
Your order comes to 37.9.
{"edemame"=>5.0}
{"chirashi"=>11.95}
{"chirashi"=>11.95}
{"miso soup"=>2.0}
{"mochi"=>3.5}
{"mochi"=>3.5}
```
It was expensive.

### My Approach
I've drawn a very loose diagram to help me visualise the different classes that I might make (so that I don't have to do class extraction at a later point!). The arrows sort of show the relationships between classes. For example, a restaurant has one menu which can have many dishes. The chosen dishes would then be moved to a basket which is then finalised and added up.
![Initial diagram](https://github.com/wemmm/takeaway-challenge/blob/master/diagram.png "Initial Diagram")

### Additional Things
I had a small degree of success with the Twilio gem and managed to get it to text me. I then was unable to get it to stop texting me and had to unimplement it for the sake of my sanity. If I had had more time I would have liked to have gotten the text confirmation function working smoothly.

I would like to refactor the code to handle edge cases a bit better- for example, giving the user a message if they try to checkout an empty basket.

I also don't like that the menu items are hard coded in menu.rb. Given more time I think it would have been interesting to devise some way of using different menus- possible loading in .csv files? Or making sub classes of Restaurant with different food?
