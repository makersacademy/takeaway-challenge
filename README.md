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
This is a project which helped me to practically use the learnings from the following modules :  
  * Object-oriented programming 
  * Object-oriented design
  * SOLID principle 
  * Double, mocking and stubbing
  * Dependency injections
  
This is a takeaway ordering system. It lets a customer order items from the menu of a takeaway. There will be a text message sent to the customer's mobile to confirm the delivery. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them
Clone this repository to your desired location, run the command `gem install bundler` then run `bundle`.\

### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
gem install bundler
```

And run

```
bundle
```
You will need to create a free account with [Twillio.com](https://www.twilio.com/) and use their API to send text messages to the customers. 

***Setting environment varaibles 

A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

> :warning: **WARNING:** think twice before you push your **mobile number** or **Twilio API Key** to a public space like GitHub :eyes:

You will need to add your Twillio account sid and auth_token to the environment variables. I would recommend to add you phone number to the environment varaible as well. 

```
export account_sid='Axxxxx'
export auth_token='cxxxxxx'
export my_phone='+44xxxxxxxxxx'
```

## Running the tests

Run RSpec in the `takeaway_challenge` directory whilst in the terminal in order to run the unit tests.\

```
➜  takeaway-challenge : rspec
```

### Demo of the code 

Explain what these tests test and why

This command will create a menu for the resturant 
```
➜  takeaway-challenge git:(main) irb
 3.0.2 :002 > Dir[File.join(__dir__, 'lib', '*.r
b')].each { |file| require file }
 => 
["./lib/menu.rb",
 "./lib/order.rb",
 "./lib/sendsms.rb",
 :005 > indian = Menu.new
 => #<Menu:0x0000000101401940 @full_list=[]> 
 :006 > indian.add_item("Samosa", 2)
 => [{:item=>"Samosa", :price=>2}] 
 :007 > indian.add_item("Ladoo", 4)
 => [{:item=>"Samosa", :price=>2}, {:item=>"Ladoo", :price=>4}] 
 :008 > langley = Takeaway.new(indian)
 => 
#<Takeaway:0x0000000105277d28                         
...                                                   
 :009 > customer = Order.new(langley)
 => 
#<Order:0x00000001014a2750                               
...                                                      
 :010 > customer.item_selection(3, "Samosa")
 => "you have selected 3 x => Samosa's" 
 :011 > customer.item_selection(5, "Ladoo")
 => "you have selected 5 x => Ladoo's" 
 :012 > customer.verify_order
|No. of items| |Item| |Price(£)|
                                                         
 | 3 |  | Samosa |  | 6 |                                
 | 5 |  | Ladoo |  | 20 |  => "Your total is : 26"  
 :013 > customer.send_message
 => 
#<SendSms:0x00000001032e3a98
 @text_message=
  "Thank you! Your order was placed and will be delivered before 12:31 PM"> 
```


## Built With

* [Ruby](https://www.ruby-lang.org/en/documentation/) - The programming language used
* [Twillio](https://www.twilio.com/messaging-api) - SMS API



User Stories
-----

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
