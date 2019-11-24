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

This is the weekend challenge at the end of my second week at Makers Academy, a 16-week software developer bootcamp. For all the instructions, please refer to the main [README](https://github.com/AndreaDiotallevi/takeaway-challenge/blob/master/README.md).

Prerequisites
-------

* Fork this repository
* Clone the new repository into your machine with ```git clone```
* Run the command ```bundle``` in the project directory to ensure you have all the gems

Class Diagrams
-------

| Dish   | Menu            | TakeAway               | Restaurant      | TextProvider    |
| ---    | ----            | ---                    | ---             | ---             |
| @name  | @dishes         | @basket                | @takeaway       | @client         |
| @price |                 | @menu                  | @text_provider  |                 |
|------- | --------------- | ---------------------- | --------------- | --------------- |
|        | add(dish)       | read_menu              | checkout(price) | send_text(time) |
|        | list            | order(dish, quantity)  |                 |                 |
|        | contains?(dish) | basket_summary         |                 |                 |
|        |                 | total                  |                 |                 |
|        |                 | correct_amount?(price) |                 |                 |
|        |                 | empty?                 |                 |                 |
|        |                 | complete               |                 |                 |
|------- | --------------- | ---------------------- | --------------- | --------------- |
|        |                 | calculate_total        | delivery_time   |                 |


Feature Test
-------

```
$ irb
2.6.5 :001 > require "./lib/dish.rb"
 => true 
2.6.5 :002 > require "./lib/menu.rb"
 => true 
2.6.5 :003 > require "./lib/takeaway.rb"
 => true 
2.6.5 :004 > require "./lib/restaurant.rb"
 => true 
2.6.5 :005 > require "./lib/text_provider.rb"
^[[A => true 
2.6.5 :006 > dish1 = Dish.new("Carbonara", 10)
 => #<Dish:0x00007fd7186d4d80 @name="Carbonara", @price=10> 
2.6.5 :007 > dish2 = Dish.new("Puttanesca", 12)
 => #<Dish:0x00007fd7186e7020 @name="Puttanesca", @price=12> 
2.6.5 :008 > dish3 = Dish.new("Bolognese", 14)
 => #<Dish:0x00007fd7186eca70 @name="Bolognese", @price=14> 
2.6.5 :009 > menu = Menu.new
 => #<Menu:0x00007fd7186f5940 @dishes=[]> 
2.6.5 :010 > menu.add(dish1)
 => "Carbonara added to the menu" 
2.6.5 :011 > menu.add(dish2)
 => "Puttanesca added to the menu" 
2.6.5 :012 > menu.add(dish3)
 => "Bolognese added to the menu" 
2.6.5 :013 > menu.list
 => "Carbonara (£10), Puttanesca (£12), Bolognese (£14)" 
2.6.5 :014 > menu.contains?(dish1)
 => true 
2.6.5 :015 > menu.contains?(Dish.new("Cacio e pepe", 13))
 => false 
2.6.5 :016 > takeaway = TakeAway.new(menu)
 => #<TakeAway:0x00007fd71872e510 @basket={}, @menu=#<Menu:0x00007fd7186f5940 @dishes=[#<Dish:0x00007fd7186d4d80 @name="Carbonara", @price=10>, #<Dish:0x00007fd7186e7020 @name="Puttanesca", @price=12>, #<Dish:0x00007fd7186eca70 @name="Bolognese", @price=14>]>> 
2.6.5 :017 > takeaway.basket
 => {} 
2.6.5 :018 > takeaway.empty?
 => true 
2.6.5 :019 > takeaway.order(dish1, 3)
 => "3x Carbonara(s) added to your basket" 
2.6.5 :020 > takeaway.order(dish2, 5)
 => "5x Puttanesca(s) added to your basket" 
2.6.5 :021 > takeaway.order(dish3, 2)
 => "2x Bolognese(s) added to your basket" 
2.6.5 :022 > takeaway.basket_summary
 => "Carbonara x3 = £30, Puttanesca x5 = £60, Bolognese x2 = £28" 
2.6.5 :023 > takeaway.total
 => "Total: £118" 
2.6.5 :024 > text_provider = TextProvider.new
 => #<TextProvider:0x00007fd7181cd008 [...]> 
2.6.5 :025 > restaurant = Restaurant.new(takeaway, text_provider)
 => #<Restaurant:0x00007fd71828cb38 [...]> 
2.6.5 :026 > restaurant.checkout(100)
Traceback (most recent call last):
        5: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/student/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):26
        1: from /Users/student/Code/makersacademy/takeaway-challenge/lib/restaurant.rb:13:in `checkout'
RuntimeError (Payment amount not correct)
2.6.5 :027 > restaurant.checkout(118)
 => "Thank you for your order" 
```
