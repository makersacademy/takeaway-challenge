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

Overview
-------

A program to allow users to place a takeaway order and receive a confirmation sms via the Twilio api

Approach
--------

* I attemtped to make the program feel as intuitive as possible, printing strings to $stdout in natural language.

* This challenge was a good opportunity to pratice making use of the dependancy injection and delegation pronciples.

* unit & feature tested at > 99% coverage (feature tests in `/spec/integration`)

Usage
-----

`bundle install`
* to use the sms service, you will need to create a [`.env`](https://github.com/bkeepers/dotenv) file in the root of the project directory with your Twilio account details (see examples variables below) 

```
ACCOUNT_SID="@account_sid"
AUTH_TOKEN="@auth_token"
TWILIO_FROM="from:"
TWILIO_TO="to:"
```

* Example usage:

```
2.4.0 :001 > require './lib/takeaway'
 => true
2.4.0 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x007f89188706b0 @menu @message_service @basket>
2.4.0 :003 > takeaway.print_menu
 => special fried rice: £4.0
 => wonton soup: £3.0
 => crispy seaweed: £3.5
2.4.0 :004 > takeaway.order('wonton soup', 2)
 => 2 wonton soup added to basket
2.4.0 :005 > takeaway.order 'crispy seaweed'
 => 1 crispy seaweed added to basket
2.4.0 :006 > takeaway.order_summary
 => 2 wonton soup = £6.0
 => 1 crispy seaweed = £3.5
2.4.0 :008 > takeaway.order_total
 => "Total = £9.5"
2.4.0 :009 > takeaway.checkout(9.50)
```
