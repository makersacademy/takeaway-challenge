# Takeaway Challenge

```
                            _________
              r==           |       |
           _  //            |  FOOD |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

```

## Introduction

Welcome to my repo for the Makers Academy weekend challenge(2). My task was to test drive the creation of a set of classes/modules to satisfy the user stories below. I needed to design a takeaway program that displays a list of dishes (with prices), and allows the user to place an order, displays a sum total of what they have spent, and sends a text message confirmation to the user with details of their purchases (using Twilio API).

## Useage

```
[1] pry(main)> require "./lib/takeaway"
=> true
[2] pry(main)> takeaway = Takeaway.new
Hi! May I take your order?
=> #<Takeaway:0x00007fdb2185adc8 @basket=[], @complete=#<Complete:0x00007fdb2185ad50>, @itemised_bill=[]>
[3] pry(main)> takeaway.view_menu
=> [{"Buckwheat Shamalam"=>5.0}, {"Avocado Foxtrot"=>6.5}, {"Crusty Snickerdoodle"=>4.5}, {"Froffee Coffee"=>3.5}, {"Realitea"=>2.0}, {"Mystery Item"=>10.0}]
[4] pry(main)> takeaway.add("Crusty Snickerdoodle")
=> {"Crusty Snickerdoodle"=>1}
[5] pry(main)> takeaway.add("Froffee Coffee")
=> {"Crusty Snickerdoodle"=>1, "Froffee Coffee"=>1}
[6] pry(main)> takeaway.add("Froffee Coffee")
=> {"Crusty Snickerdoodle"=>1, "Froffee Coffee"=>2}
[7] pry(main)> takeaway.total
=> 11.5
[8] pry(main)> takeaway.checkout
Your order is complete! You will receive a confirmation text. Thank you!=> nil
[9] pry(main)>
```

## Specification

In order to be successful at this challenge, my code **MUST**:

- [ ] Display list of dishes with prices.
- [ ] Allows the user to select a number of dishes.
- [ ] Show the total cost of the order - and this amount should correspond with the price of each dish.
- [ ] Send a text message to the user with an order confirmation.
