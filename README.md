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

Welcome to Makers Ice Cream Academy

We specialise in the finest lab-grown experimental ice-cream flavours.

Our products have no calories, fat, sugar or natural ingredients and are completely devoid of any nutritional value whatsoever.

You can:
- display the menu;
- select an ice cream; and
- place an order.

We will:
- calculate the order total;
- check that it's correct; and
- confirm the order with a text message.

We ship our ice creams by supersonic drone.

For oral use only. Always read the label.

Suitable for vegans.

<h3>Get Started</h3>


```rb
irb -r './lib/takeaway.rb'

takeaway = Takeaway.new

```
<h3>View the Menu</h3>

```rb

takeaway.display_menu

```

<h3>Select an Ice Cream</h3>

```rb

takeaway.select_dish(dish)

```

We'll add the dish to your order if it's on the menu.

Keep adding items till you're ready to place an order

<h3>Place an Order</h3>

```rb

takeaway.place_order

```
We'll let you know the bill total.
