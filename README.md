### [Makers Academy](http://www.makersacademy.com) - Week 2 Weekend Project

Takeaway Ruby Challenge - original README [here](https://github.com/makersacademy/takeaway-challenge/blob/master/README.md)
-

[Outline](#Outline) | [Task](#Task) | [User Stories](#Story) | [Installation Instructions](#Installation) | [Example run](#Example_run) | [Future work](#Future_work)

## <a name="Outline">Outline</a>

Build a small takeaway program in Ruby!

## <a name="Task">The Task</a>

This challenge starts with going over the foundational skills from this week's Oystercard challenge and then introduces some additinal complexities with the use of the Twilio API.

## <a name="Story">User Stories</a>

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```

```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

## <a name="Installation">Installation Instructions</a>

1. Clone the repo to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. In order to maintain privacy of the Twilio key and your phone number, set up the following env. variables in your .bashrc or .zshrc file

```
export TWILIO_NUMBER=the number you bought from Twilio which will send the texts
export MY_NUMBER=your verified phone number which will recieve the texts
export TWILIO_AUTH_TOKEN=your auth token from your Twilio account
export TWILIO_ACCOUNT_SID=your account sid from your Twilio account
```

5. Run the programme in IRB
6. Tests can be run using Rspec

## <a name="Example run">Example run</a>

Here is a functional example of how the program would look if you ran through it in IRB. Note that the confirmation text is sent on line 8 when the correct payment is received.

```
$ irb -r ./lib/takeaway.rb                                                                
2.6.5 :001 > cart = Cart.new
 => #<Cart:0x00007fc72f061d98 @cart={}, @menu={"burger"=>5, "fries"=>3, "shake"=>2}> 
2.6.5 :002 > takeaway = TakeAway.new(cart)
 => #<TakeAway:0x00007fc72b87d1c0 @cart=#<Cart:0x00007fc72f061d98 @cart={}, @menu={"burger"=>5, "fries"=>3, "shake"=>2}>> 
2.6.5 :003 > takeaway.show_menu
 => {"burger"=>5, "fries"=>3, "shake"=>2} 
2.6.5 :004 > cart.add_item("burger")
 => "1x burger added to your cart" 
2.6.5 :005 > cart.add_item("fries", 2)
 => "2x fries added to your cart" 
2.6.5 :006 > cart.summarize
 => "burger x 1 = 5, fries x 2 = 6" 
2.6.5 :007 > cart.total
 => "Total: £11" 
2.6.5 :008 > takeaway.pay(11)
 => "Payment accepted" 
2.6.5 :009 > 
```

## <a name="Future work">Future work</a>

I was able to complete the program to specification, using RSpec to drive the most of the program. However, right now, the tests still send a text. In future, I will work on stubbing the Twilio API in the test for the Messages class so that running the tests doesn't send the confirmation text. 