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

We're an experimental restaurant specialising in genetically modified and chemically enhanced ice-cream flavours.

Our products have no calories, fat, sugar or natural ingredients and are completely devoid of any nutritional value whatsoever.

You can
- view the menu
- select an ice cream
- place an order

We will
- calculate the order total
- check that it's correct
- confirm the order with a text message

We generate our prices randomly and ship our ice creams by supersonic drone.

For oral use only. Always read the label. Suitable for vegans.

<h3>How to View the Menu</h3>


```rb
irb -r './lib/takeaway.rb'

takeaway = Takeaway.new

takeaway.display_menu
```

<h3>How to Select an Ice Cream</h3>

```
takeaway.select_dish(dish)
```

We'll add the dish to your order if it's on the menu.
