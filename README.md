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

We generate our prices randomly and ship our ice creams by supersonic drone.

For oral use only. Always read the label. Suitable for vegans.

<h3>How to View the Menu</h3>

irb -r './lib/takeaway.rb'

```rb
takeaway = Takeaway.new

takeaway.display_menu
```

<h3>How to Select an Ice Cream</hr>

```
takeaway.select_dish(dish)
```

We'll add the dish to your order if it's on the menu.
