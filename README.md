[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)

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

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
```
[2] pry(main)> ta = Takeaway.new
=> #<Takeaway:0x007fb1bb1ccbd0 @bill=[], @shopping_basket=[]>
[3] pry(main)> ta.view_menu
=> [{:food=>"Fish and Chips", :price=>5.5},
 {:food=>"Sunday Lunch", :price=>12},
 {:food=>"Haggis", :price=>6},
 {:food=>"Tuna and Pasta", :price=>4.5},
 {:food=>"Doughnuts", :price=>3}]

```
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
```

[4] pry(main)> ta.select_food
"Please place your order: "
Fish and Chips
"How many would you like: "
1
=> "You have added Fish and Chips to the basket"

```
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
```
[6] pry(main)> ta.view_order
=> [{:food=>"Fish and Chips", :price=>5.5}]
[7] pry(main)> ta.show_bill
=> "Your bill is: £5.5"

```
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
```
[8] pry(main)> ta.confirm_order
=> <Twilio::REST::Message @path=/2010-04-01/Accounts/AC7695dc59fa4930a649cae55fb55773a6/Messages/SMb853e103401a4bceb5ff97b11718a7ba>


```
```
