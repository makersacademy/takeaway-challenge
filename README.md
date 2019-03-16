# Takeaway Challenge
**==================**
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

The task was to build a program that displayed a menu, adds things to a basket, displays a basket, completes an order and sends a text message confirming the order.

## Getting Started

```sh
$ git clone https://github.com/saypop/takeaway-challenge.git
$ cd takeaway-challenge
```
Then see Deployment below.

### Prerequisites

You'll need ruby installed on your system.
```sh
$ brew install ruby
```

And you'll need Twilio.
```sh
$ gem 'twilio-ruby'
```

## Running the tests

```sh
$ cd takeaway-challenge
$ rspec
```

All 7 rspec tests pass. Coverage is at 84.68%, but this is counting private methods. If you don't include private methods (which should probably be another class called Line_Item) then coverage is around 93%. The reason it is so low is because I don't know how to test the Twilio messager.

and

```sh
$ cd takeaway-challenge
$ rubocop
```

Rubocop detects 3 errors which have to do with line or method length.

## Deployment

Run this program like so:

```sh
2.5.0 :001 > require './lib/takeaway.rb'

 => true
2.5.0 :002 > t = TakeAway.new
 => #<TakeAway:0x00007fb16f24cb38 @menu=#<TakeAwayMenu:0x00007fb16f24cb10 @read={"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}>, @basket=#<Basket:0x00007fb16f24cac0 @basket=[], @menu=#<TakeAwayMenu:0x00007fb16f24cb10 @read={"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}>>>
2.5.0 :003 > t.read_menu
 => {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
2.5.0 :004 > t.add_to_basket("spring roll")
 => "spring roll added to basket"
2.5.0 :005 > t.add_to_basket("spring roll")
 => "spring roll added to basket"
2.5.0 :006 > t.add_to_basket("peking duck")
 => "peking duck added to basket"
2.5.0 :007 > t.view_basket
 => "Your basket total is 10.96 and it contains:\n1 x spring roll for 0.99 each\n2 x spring roll for 0.99 each\n1 x peking duck for 7.99 each"
2.5.0 :008 > t.add_to_basket("pork dumpling")
 => "pork dumpling added to basket"
2.5.0 :009 > t.view_basket
 => "Your basket total is 13.95 and it contains:\n1 x spring roll for 0.99 each\n2 x spring roll for 0.99 each\n1 x peking duck for 7.99 each\n1 x pork dumpling for 2.99 each"
2.5.0 :010 > t.complete_order('+44712345678')
 => "Thank you for your order. A confirmation text has been sent to +44712345678."
```


## Built With

* Ruby
* Twilio

## Author

* **Tomé Jesus** - (https://github.com/saypop)

## Acknowledgments

* Shout out to my peeps over at Twilio - nice looking out yo (https://www.twilio.com).
* Big up to the Mad March squad over at Makers Academy - I couldn't see you but I felt you the whole way along this journey.
* Huge thanks to meditation - namaste, jai ma, om shanti shanti, mo' fire.
* Mad respect to da real OG... my brain - you're taking some hard knocks like a champ and you keep getting up for more, fo real tho homie I don't know where I'd be without you. Much love.

## Feature Tests

See the spec.rb file in the spec folder for all feature tests performed.
