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

Instructions
-------

* Fork this repo and clone the files to your own project directory.
* From the command  run ``` bundle install ``` This will add all the necessary gemfiles to the project directory to ensure you can run the files.

```
$ irb
[1] > dish = Dish.new("chicken tikka masala",4.2)
[2] > stock = DishInventory.new
 => #<DishInventory:0x007fb9c125ae90 @dishes=[]>
[3] > stock.add_dish(dish)
 => [#<Dish:0x007fb9c12b00e8 @name="chicken tikka masala", @price=4.2>]
 [4] > manager = OrderManager.new(stock)
 => #<OrderManager:0x007fb9c191a0c8 @inventory=#<DishInventory:0x007fb9c125ae90 @dishes=[#<Dish:0x007fb9c12b00e8 @name="chicken tikka masala", @price=4.2>, #<Dish:0x007fb9c194bf88 @name="Pad Thai", @price=1.2>, #<Dish:0x007fb9c1941628 @name="Sushi", @price=4.4>, #<Dish:0x007fb9c128a848 @name="Fish and Chips", @price=5.2>, #<Dish:0x007fb9c12794a8 @name="Nandos", @price=5.2>, #<Dish:0x007fb9c1268298 @name="Dominoes", @price=5.3>]>>
 [5] > order = manager.create_order
 => #<Order:0x007fb9c1910988 @current_order=[]>
 [6] > order.add_dish(dish2,3)
 => [{:dish=>#<Dish:0x007fb9c194bf88 @name="Pad Thai", @price=1.2>, :quantity=>3}]
[7] > order.add_dish(dish4,2)
 => [{:dish=>#<Dish:0x007fb9c194bf88 @name="Pad Thai", @price=1.2>, :quantity=>3}, {:dish=>#<Dish:0x007fb9c128a848 @name="Fish and Chips", @price=5.2>, :quantity=>2}]
[8] > manager.submit_order(order,14)
 => "Message sent"
```


* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
