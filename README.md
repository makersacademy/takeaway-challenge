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

A program to allow users to place a takeaway order and recive a confirmation sms via the Twilio api

Approach
--------

Keep it DRY, SOLID & TDD `--init`

Usage
-----

* Clone this repo
* Run 'bundle' to ensure you have all the gems
* to use the sms service, you will need to set up a `.env` file with your Twilio account details (see examples variables below) 

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
