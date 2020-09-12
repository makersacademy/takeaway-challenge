Catzkorn's Takeaway
==================
```
                            __________
              r==           |        |
           _  //            |CATZKORN|   ))))
          |_)//(''''':      |        |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Welcome to Catzkorns Takeaway!
-------

How to use:
You are able to set-up your own takeaway or use the default restaurant I have created!



# For default:


### Please Note:
Using this method below will not send you a text message as intended, but has a replacement that will print a confirmation message in the terminal. If you wish to receive a text message, you will need a [Twilio](https://www.twilio.com) account. For this to happen, you will need to input details of your Twilio account as the second parameter in `Order.new` by this syntax:

```
twilio_messenger = Message.new(account_sid, auth_token, account_phone_num) 

order = Order.new(menu, twilio_messenger)
```

## IRB

To use the standard menu, open IRB in your terminal

```
charlotte@Charlottes-MBP takeaway-challenge % irb
2.6.5 :001 > 
```
 and run these commands in IRB.


> require "./lib/order"
```
2.6.5 :004 > require "./lib/order"
 => true 

 ```

 ### To generate the menu:
 > mildreds = Menu.new
 ```
2.6.5 :005 > mildreds = Menu.new
 => #<Menu:0x00007fc14bc51570 @name="Mildreds", @menu=[#<Dish:0x00007fc14b83cf48 @name="Soul Bowl", @price=13.99>, #<Dish:0x00007fc14b83ce58 @name="Tofu Donburi", @price=13.5>, #<Dish:0x00007fc14b83cc28 @name="Buffalo Chick'n Burger", @price=10.0>, #<Dish:0x00007fc14b83cb10 @name="Gyoza", @price=6.5>]> 
2.6.5 :006 > 
```

### To view the menu:

> mildreds.view_menu
```
2.6.5 :007 > mildreds.view_menu
Welcome to Mildreds.................
Soul Bowl.....................£13.99
Tofu Donburi..................£13.50
Buffalo Chick'n Burger........£10.00
Gyoza.........................£6.50
```


### To create an order: 

> order = Order.new(mildreds)

```
2.6.5 :003 > order = Order.new(mildreds)
 => #<Order:0x00007fe4f2b09918 @menu=#<Menu:0x00007fe4f2b02b18 @name="Mildreds", @menu=[#<Dish:0x00007fe4ee160528 @name="Soul Bowl", @price=13.99>, #<Dish:0x00007fe4ee1604b0 @name="Tofu Donburi", @price=13.5>, #<Dish:0x00007fe4ee160410 @name="Buffalo Chick'n Burger", @price=10.0>, #<Dish:0x00007fe4ee1603c0 @name="Gyoza", @price=6.5>]>, @customer_selection=[], @messenger=#<MessengerStandIn:0x00007fe4f2b098f0>> 
2.6.5 :004 > 

```

### To add dishes to your order:

> order.add("dish", quantity)

```
2.6.5 :004 > order.add("Tofu Donburi", 3)
 => 3 
 2.6.5 :005 > order.add("gyoza", 2)
 => 2 
 2.6.5 :006 > order.add("BUFFALO CHICK'N BURGER", 1)
 => 1 
```

### To check order total:

> order.total

```
2.6.5 :007 > order.total
 => 63.5 
```

### To place your order:

> order.place_order("phone number with area code")

```
2.6.5 :008 > order.place_order("+44123456789")
Thank you for your order! It will be delivered by 20:24.
```

# To create your own takeaway and menu:

Initialize Menu.new as follows:


>restaurant_name = Menu.new(resturant name, [array of `Dish.new(name, cost)`])

```
redemption = Menu.new("Redemption", [Dish.new("Vegan Korma", 13.99), Dish.new("Pesto Pasta", 8.50), Dish.new("Dragon Soup", 12.99)])
 => #<Menu:0x00007fe4f2b58568 @name="Redemption", @menu=[#<Dish:0x00007fe4f2b58658 @name="Vegan Korma", @price=13.99>, #<Dish:0x00007fe4f2b58608 @name="Pesto Pasta", @price=8.5>, #<Dish:0x00007fe4f2b585b8 @name="Dragon Soup", @price=12.99>]> 
2.6.5 :010 > redemption.view_menu
Welcome to Redemption...............
Vegan Korma...................£13.99
Pesto Pasta...................£8.50
Dragon Soup...................£12.99

```
and follow the result of the steps detailed under default!

---

Any questions, contact me [@Catzkorn](https://twitter.com/catzkorn) on twitter!
