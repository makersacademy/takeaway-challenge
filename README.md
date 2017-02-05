
 BUILD STATUS: ![alt text](https://travis-ci.org/olwend/takeaway-challenge.svg?branch=master)

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
![Domain Model][logo]
[logo]:https://github.com/olwend/takeaway-challenge/blob/master/Takeaway.png
* As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices _DONE_

* As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes _DONE_

* As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

* As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered _TEXT RECEIVED BUT CODE FOR 3 NOT DONE SO IT IS GENERIC_
```
First attempt of this challenge, I diverted into user input,losing time trying to get rspec working for gets.chomp.
Thus I revisited to complete order selection and creation.

Instructions - to demo stories 1 & 2 in irb
-------------
`2.3.1 :001 > require './lib/menu'
 => true
 1. View menu
2.3.1 :002 > menu = Menu.new
```
Comfortingly good for you - FoodBuddy weekday menu
--------------------------------------------------
0.Greek-style roast fish @ £ 4.59  

1.Pea falafels with minty couscous salad @ £ 3.59  

2.Mixed bean chilli with wedges @ £ 4.09  

3.Crab & Sweetcorn chowder @ £ 4.59  

4.Quinoa frittata @ £ 4.99  

```
2. Create Select_items instance and input choice
```
2.3.1 :007 > choice = Select_items.new
 => #<Select_items:0x007fa6831b2048 @items=[]>
 
2.3.1 :008 > choice.input_items
Please enter menu number of your choice
    e.g. 0 for Greek-style roast fish
To finish order, hit return twice
3
Thankyou now enter quantity wanted
4
Please enter menu number of your choice
    e.g. 0 for Greek-style roast fish
To finish order, hit return twice
2
Thankyou now enter quantity wanted
4
Please enter menu number of your choice
    e.g. 0 for Greek-style roast fish
To finish order, hit return twice
1
Thankyou now enter quantity wanted
5
Please enter menu number of your choice
    e.g. 0 for Greek-style roast fish
To finish order, hit return twice

 => [{:id=>"3", :quantity=>"4"}, {:id=>"2", :quantity=>"4"}, {:id=>"1", :quantity=>"5"}]
 ```
3. Process order

4. Send confirmation SMS -  To send the text run command line
 `ruby twilio_test.rb`
