Bob's Burritos - Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            | Bob's |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

## Makers Week 2 Challenge
For my second solo challenge at [Makers](https://www.makers.tech/) I was tasked with creating an ordering system for a takeaway restaurant.

Get ready to salivate as you get to know Bob and his amazing Burritos.

I was working from the following user stories:
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
## Installation

1. Clone this repo to your local machine
2. Run the command ```gem install bundler``` (if you don't have bundler already)
3. When the installation completes, run ```bundle```

## Set Up For Twilio
You can only try out the SMS message functionality if you have (or want to get) a Twilio account.

You will need to edit the ```.env``` file and fill it in with your details. 

Head to https://console.twilio.com/ to get your details or set up an account.

## Running Tests

Run ```rspec```


## Usage
Launch ```irb``` and use as below:
```ruby
You@YourComputer takeaway-challenge % irb
3.0.2 :001 > require './lib/takeaway'
 => true 
3.0.2 :002 > bobs = Takeaway.new
#<Takeaway:0x00007f82e52dd308
... 
3.0.2 :003 > bobs.menu
                               Welcome to Bob's Burritos!

                 Mega Everything Burrito - dish: 1 -  £15.00
                            Beef Burrito - dish: 2 -  £10.00
                         Chicken Burrito - dish: 3 -   £9.00
                          Veggie Burrito - dish: 4 -   £8.00
                           Super Sangria - dish: 5 -   £7.00
 => "To order: bobs.order(dish:4) to order 1, or bobs.order(dish: 4, x: 13) if you're really hungry!" 
3.0.2 :004 > bobs.order(dish: 1)
 => "1 x  Mega Everything Burrito - added to your order :)" 
3.0.2 :005 > bobs.order(dish: 4, x: 3)
 => "3 x  Veggie Burrito - added to your order :)" 
3.0.2 :006 > bobs.order(dish: 5, x: 50)
 => "50 x  Super Sangria - added to your order :)" 
3.0.2 :007 > bobs.basket

         Your Basket of Burrito Goodness

  Mega Everything Burrito x 1     £15.00
           Veggie Burrito x 3     £24.00
          Super Sangria x 50     £350.00
                       Total:    £389.00
 => "Order some more items, or if all looks good type: bobs.checkout('+yournumber')" 
3.0.2 :008 > bobs.unorder(dish: 5, x: 45)
 => "45 x  Super Sangria - removed from your order :)" 
3.0.2 :009 > bobs.basket

         Your Basket of Burrito Goodness

  Mega Everything Burrito x 1     £15.00
           Veggie Burrito x 3     £24.00
            Super Sangria x 5     £35.00

                        Total:    £74.00
 => "Order some more items, or if all looks good type: bobs.checkout('+yournumber')" 
3.0.2 :010 > bobs.checkout('+4475551342')
 => "Thank you! Your order was placed and will be delivered before 13:42"
```
