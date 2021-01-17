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

Welcome to Pete's Ice Cream Emporium

We specialise in the finest lab-grown experimental ice-cream flavours.

Our products have no calories, fat, sugar or natural ingredients and are completely devoid of any nutritional value whatsoever.

You can:
- display the menu;
- select an ice cream; and
- place an order.

We will:
- calculate the bill;
- check that it's correct; and
- confirm the order with a text message.

We ship our ice creams by supersonic drone.

For oral use only. Always read the label.

Suitable for vegans.

<h3>Get started</h3>


```rb
irb -r './lib/takeaway.rb'

takeaway = Takeaway.new

```
<h3>View the menu</h3>

```rb

takeaway.display_menu

```

<h3>Select an ice cream</h3>

```rb

takeaway.select_dish("dish")

```

We'll add the dish to your order if it's on the menu.

Keep adding items till you're ready to place an order.

<h3>Place an order</h3>

```rb

takeaway.place_order("+441234567890")

```
We'll let you know the bill total.
