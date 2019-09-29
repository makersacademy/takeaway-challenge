Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |   /\  |   ))))
          |_)//(''''':      |  /\/\ |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Setup Instructions
-------

run messager.rb in your favourite ruby shell. Create a list of dishes for your restaurant and create a Takeaway instance using them, then #run the instance:


```Ruby
dishes = []

[["Copius Fried Wild Greens", 3],
["Spicy Sauteed Peppers", 3],
["Copius Mushroom Skewers", 5],
["Vegetable Omlette", 6],
["Fried Egg and Rice", 5],
["Monster Curry", 6],
["Mushroom Risotto", 5],
["Creamy Heart Soup", 8]].each { |item| dishes.append(Dish.new(name: item[0], cost: item[1])) }

links_wild_delivery = Takeaway.new(dishes)

links_wild_delivery.run
```

Using the App
-------

The first screen is the restaurant menu:

```Ruby
Welcome to Link's Wild Delivery!
Here's the menu, please enter which items you'd like:
1.  Copius Fried Wild Greens       💎  3
2.  Spicy Sauteed Peppers          💎  3
3.  Copius Mushroom Skewers        💎  5
4.  Vegetable Omlette              💎  6
5.  Fried Egg and Rice             💎  5
6.  Monster Curry                  💎  6
7.  Mushroom Risotto               💎  5
8.  Creamy Heart Soup              💎  8
```

The user can select any number of dishes to add to their order, then can enter nothing to finish selecting.
The second menu allows them to review their order, return to add dishes to their orider, check the total or submit the order.

```Ruby
1.  Review Order
2.  Add Items to Order
3.  Check Total
4.  Submit Order
Please make a selection:
```

Reviewing the order shows the quantity of each selected item and the total cost in roupees:

```Ruby
2  x  Copius Fried Wild Greens       💎  3
1  x  Copius Mushroom Skewers        💎  5
Total:                               💎 11
```

When submitted, there is a confirmation message and an SMS is sent to the `ENV['TWILIO_TO']` environment variable phone number via the Twilio REST API:

```Ruby
Thanks, your order has been submitted!
You should receive an SMS with delivery information shortly
```
