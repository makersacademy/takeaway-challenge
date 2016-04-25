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

 This is the Week 2 Ronin Weekend Challenge. In this Challenge we must replicate a takeaway ordering system. I will be following the processes found in the [Oystercard Challenge] (https://github.com/makersacademy/course/blob/master/oystercard/README.md).

 The challenge instructions can be found [here] (https://github.com/missamynicholson/takeaway-challenge)

The following is an irb test to demonstrate the takeaway process.
 ```
 2.2.3 :004 > dish_tikka = Dish.new(name: "Tikka", price: 7.95)
 => #<Dish:0x007ffc7a9711d8 @name="Tikka", @price=7.95>
2.2.3 :005 > dish_chow = Dish.new(name: "Chow", price: 6.95)
 => #<Dish:0x007ffc7a993828 @name="Chow", @price=6.95>
2.2.3 :006 > menu = Menu.new(dishes: [dish_tikka, dish_chow])
 => #<Menu:0x007ffc7aa65738 @dishes=[#<Dish:0x007ffc7a9711d8 @name="Tikka", @price=7.95>, #<Dish:0x007ffc7a993828 @name="Chow", @price=6.95>]>
2.2.3 :007 > message_system = MessageSystem.new
 => #<MessageSystem:0x007ffc7aa35ab0>
2.2.3 :008 > order_calculator = OrderCalculator.new
 => #<OrderCalculator:0x007ffc7b03b680>
2.2.3 :009 > order = Order.new(menu: menu, order_calculator: order_calculator, message_system: message_system)
 => #<Order:0x007ffc7b048a10 @dishes_ordered=[], @order_calculator=#<OrderCalculator:0x007ffc7b03b680>, @message_system=#<MessageSystem:0x007ffc7aa35ab0>, @menu=#<Menu:0x007ffc7aa65738 @dishes=[#<Dish:0x007ffc7a9711d8 @name="Tikka", @price=7.95>, #<Dish:0x007ffc7a993828 @name="Chow", @price=6.95>]>>
2.2.3 :010 > dish_random = Dish.new(name: "Satay", price: 3.95)
 => #<Dish:0x007ffc7b063e00 @name="Satay", @price=3.95>
2.2.3 :011 > order.add(dish_tikka, 3)
 => [{:dish=>#<Dish:0x007ffc7a9711d8 @name="Tikka", @price=7.95>, :quantity=>3}]
2.2.3 :012 > order.add(dish_chow, 2)
 => [{:dish=>#<Dish:0x007ffc7a9711d8 @name="Tikka", @price=7.95>, :quantity=>3}, {:dish=>#<Dish:0x007ffc7a993828 @name="Chow", @price=6.95>, :quantity=>2}]
2.2.3 :013 > order.add(dish_random, 1)
RuntimeError: Not on menu
2.2.3 :014 > order.check_total(37.75)
 => "Thank you! Your order was placed and will be delivered before 09:55"
```

 [![Coverage Status](https://coveralls.io/repos/github/missamynicholson/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/missamynicholson/takeaway-challenge?branch=master)

 [![Build Status](https://travis-ci.org/missamynicholson/takeaway-challenge.svg?branch=master)](https://travis-ci.org/missamynicholson/takeaway-challenge)
