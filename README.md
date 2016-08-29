#Takeaway Challenge

##Description
A program that allows a customer to order a takeaway. The customer can view the menu, add items off the menu to their basket, view a summary of their basket and checkout their order.

##Classes
This program has three classes:

1. Takeaway

2. Order

3. Menu

###Takeaway
This class initialises with a menu and allows an order to be created. It includes the following public methods:
- `show_menu`, which sends the `show_dishes` message to Menu
-  `add` which takes two arguments - one being the dish and the second being an optional quantity arguments. This method send the `check_dish` message to Menu, and if no error is raised, adds the dish to the basket.
- `summary`, which sends the `summary` message to Order, returning a list of ordered dishes, quantities, prices and a total to pay.

###Menu
This class understands dishes and their prices. It can generate a readable list of menu items and prices using the method `show_dishes` and can check whether a dish is on the menu using `check_dish`.

###Order
This class understands the dishes that have been ordered. It can place ordered items in the basket using the method `add_dish` and can produced a readable summary of items in basket using `summary`.

##How to use
```
2.3.1 :001 > require './lib/takeaway'
 => true
2.3.1 :002 > t = Takeaway.new
 => #<Takeaway:0x007ff81ba9dce0 @menu=#<Menu:0x007ff81ba9dcb8 @dishes={"Banana Chowder"=>5.45, "Hedgeree"=>7.65, "Thai Green Jelly"=>4.95, "Mackerel Muffins"=>3.75, "Smoked Goat Tart"=>6.75, "Prawn Sundae"=>6.75}>, @order=#<Order:0x007ff81ba9dc90 @basket={}, @menu=#<Menu:0x007ff81ba9dc68 @dishes={"Banana Chowder"=>5.45, "Hedgeree"=>7.65, "Thai Green Jelly"=>4.95, "Mackerel Muffins"=>3.75, "Smoked Goat Tart"=>6.75, "Prawn Sundae"=>6.75}>>>
2.3.1 :003 > t.show_menu
1. Banana Chowder - £5.45
2. Hedgeree - £7.65
3. Thai Green Jelly - £4.95
4. Mackerel Muffins - £3.75
5. Smoked Goat Tart - £6.75
6. Prawn Sundae - £6.75
 => {"Banana Chowder"=>5.45, "Hedgeree"=>7.65, "Thai Green Jelly"=>4.95, "Mackerel Muffins"=>3.75, "Smoked Goat Tart"=>6.75, "Prawn Sundae"=>6.75}
2.3.1 :004 > t.add 'Prawn Sundae'
Prawn Sundae has been added to your basket
 => nil
2.3.1 :005 > t.add 'Hedgeree',2
Hedgeree has been added to your basket
 => nil
2.3.1 :006 > t.summary
Prawn Sundae x 1 = £6.75
Hedgeree x 2 = £15.30
Total = £22.05
 => nil
2.3.1 :007 > t.checkout 22.05
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/AC8c09901cf8b851b3850a15add663f241/Messages/SM1c18ddb40d804ab19f2ed371fb9a72e8>
```
