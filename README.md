Takeaway Challenge
==================

This is a takeaway-delivery type program. It allows the user to create a restaurant and initialize it with a menu, and then order your favourite foods.  


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

## How to use


Require restaurant.rb file in irb

```
require './lib/restaurant'
```

Create food and drinks with a name and price

```
margherita = Item.new("Margherita", 8.50)
veggie_delight = Item.new("Veggie Delight", 5)
coke = Item.new("Coke", 2)
```

Create a restaurant and initialize the menu

```
pizzapizza = Restaurant.new(margherita, veggie_delight, coke)
```
View the restaurant menu

```
pizzapizza.view_menu
```
Create a new order

```
pizzapizza.new_order
```

Add items to the order and specify the quantity (can also remove items)

```
pizzapizza.add(margherita, 2)
pizzapizza.add(coke, 2)
pizzapizza.remove(margherita)
pizzapizza.add(veggie_delight, 2)
```

View order
```
pizzapizza.view_order
```

Place the order, and receive a text letting you know it is coming!
```
pizzapizza.place_order
```

The restaurant.rb is pretty untested, as is the texting.rb file. Need work on using doubles etc.
