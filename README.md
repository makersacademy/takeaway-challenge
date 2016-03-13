Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  J.X. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))    FOOD == HAPPINESS :D
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Introduction
-------------
This program simulates an online takeaway system that would allow restaurants to upload and modify menus, and customers to order available items and confirm their order upon checkout.

Features
-------------
* For customers:
    * Display a menu;
    * Add available items to a basket;
    * Display a basket summary, listing dishes, their quantities and prices;
    * Calculate and display a total;
    * Confirm total price upon completing order.
* For restaurants:
    * Upload and modify a menu with dishes and prices;
    * Send a confirmation text message after order is complete.

How to use Takeaway
--------------------
To clone this repo:
```
$ git clone git@github.com:junyuanxue/takeaway-challenge.git
```

Change to `takeaway-challenge` directory, open `irb` and require the `takeaway` file:
```
$ cd takeaway-challenge
$ irb
2.2.3 :001 > require "./lib/takeaway"
 => true
```

To allow the flexibility of uploading menus (from an external file or hash) and modifying items, the program does not have a built-in menu at the moment. So before we start a takeaway order, we can design a menu first. (Hmm, and I really fancy some juicy, meaty burger...)
```
2.2.3 :002 > gbk = {"avocado bacon burger" => 9.45,
2.2.3 :003 >     "kiwiburger" => 9.35,
2.2.3 :004 >     "salvador burger" => 10.55,
2.2.3 :005 >     "skinny fries" => 2.95,
2.2.3 :006 >     "oreo milkshake" => 4.75,
2.2.3 :007 >     "elderflower" => 2.35}
 => {"avocado bacon burger"=>9.45, "kiwiburger"=>9.35, "salvador burger"=>10.55, "skinny fries"=>2.95, "oreo milkshake"=>4.75, "elderflower"=>2.35}
2.2.3 :008 > burger = Menu.new
 => #<Menu:0x007fc55b960b40 @menu={}>
2.2.3 :009 > burger.upload(gbk)
 => {"avocado bacon burger"=>9.45, "kiwiburger"=>9.35, "salvador burger"=>10.55, "skinny fries"=>2.95, "oreo milkshake"=>4.75, "elderflower"=>2.35}
```

Awesome! Now we can start our takeaway.
```
2.2.3 :010 > lunch = TakeAway.new(burger, Order, Messenger)
 => #<TakeAway:0x007fc55c21a718 @menu=#<Menu:0x007fc55b960b40 @menu={"avocado bacon burger"=>9.45, "kiwiburger"=>9.35, "salvador burger"=>10.55, "skinny fries"=>2.95, "oreo milkshake"=>4.75, "elderflower"=>2.35}>, @order=#<Order:0x007fc55c21a6f0 @menu=#<Menu:0x007fc55b960b40 @menu={"avocado bacon burger"=>9.45, "kiwiburger"=>9.35, "salvador burger"=>10.55, "skinny fries"=>2.95, "oreo milkshake"=>4.75, "elderflower"=>2.35}>, @basket={}>, @messager=#<Messenger:0x007fc55b93a710 @client=<Twilio::REST::Client @account_sid=xxxxxxxxxxx>>>
```

To order a burger, some skinny fries (my favourite! :D), and of course, who can resist an Oreo milkshake:
```
2.2.3 :011 > lunch.order("avocado bacon burger")
 => "1x avocado bacon burger(s) added to your basket."
2.2.3 :012 > lunch.order("skinny fries", 2)
 => "2x skinny fries(s) added to your basket."
2.2.3 :013 > lunch.order("oreo milkshake")
 => "1x oreo milkshake(s) added to your basket."
```

You can then view your basket summary, which you can check against your total:
```
2.2.3 :014 > lunch.basket_summary
 => "avocado bacon burger x1 = £9.45, skinny fries x2 = £5.9, oreo milkshake x1 = £4.75. Total: £20.1"
2.2.3 :015 > lunch.total
 => "Total: £20.1"
```

And to complete your order:
```
2.2.3 :016 > lunch.complete_order(20.1)
 => <Twilio::REST::Message @path=/20xx-xx-xx/Accounts/xxxxxxxxxxx/Messages/xxxxxxxxxx>
```

A text message will then be sent confirming the order and delivery time.

To run the tests
-----------------
In your terminal, type `$ rspec` under `takeaway-challenge` directory and it will run all the unit tests in spec files.

Tools used
-------------
* Ruby
* RSpec
* [Twilio-Ruby] (https://github.com/twilio/twilio-ruby)
* [dotenv] (https://github.com/bkeepers/dotenv)

Author
-------
 Junyuan Xue

 [github](https://github.com/junyuanxue)  [blog](https://spinningcodes.wordpress.com/)
