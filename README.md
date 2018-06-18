# Takeaway Challenge

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

## About

This is a small project to further develop and explore object oriented programming (OOP) along with test driven development (TDD). As a customer of a non-descript takeway shop, you wish to purchase some food. This code will allow you to do this by showing you the menu, allowing you to add items to the order and confirming by text once the order is placed.

I have tried once again to follow a behaviour driven devlopment (BDD) cycle, by considering the user stories [below](#user-stories). Having more experience of multi-class systems, I found the objects were easier to describe and I think delegation was achieved better for this project than the [Airport Challenge](https://github.com/domvernon/airport_challenge).

If I had more time, I would have liked to have extracted another object or two from the main Takeaway class, as this clearly seems to be doing quite a lot and is in violation of the single-responsibility principle. I would have also like to implement a simple command line app to make it more obvious for the user as to how to place an order.

## Setup

You will need a twilio account to get the most functionality out of this project.

To run the code:

1.  Clone the repo to your local machine
2.  Change into the directory
3.  run `bundle`
4.  Create a file `.env` and fill in the following path variables needed<sup>1</sup>:

```ruby
TWILIO_ACCOUNT_SID = # This is found in your twilio account
TWILIO_AUTH_TOKEN =  # This is found in your twilio account
MY_PHONE_NUMBER =  # Make sure to put it in country code format (+44 for example)
TWILIO_PHONE_NUMBER =  # This is the number you have been given by twilio
```

5.  start `irb`

To run the tests:

1.  Change into the main directory
2.  run 'rspec'

<sup>1</sup>For further details: [see here](https://www.twilio.com/blog/2017/01/how-to-set-environment-variables.html)

## Instructions

This is an example irb transcript:

```ruby
2.4.0 :001 > require './lib/takeaway.rb'
 => true
2.4.0 :002 > t = Takeaway.new
 => #<Takeaway:0x007fe4f7c2f5b8 ... >
2.4.0 :003 > t.display_menu
 => [{:item_name=>"Pizza", :price=>"11.95"}, {:item_name=>"Vegetarian Pizza", :price=>"10.95"}, {:item_name=>"Salad", :price=>"5.25"}, {:item_name=>"Drink", :price=>"3.50"}]
2.4.0 :004 > t.choose_item('Pizza', 2)
 => "Pizza x2 = £23.90"
2.4.0 :005 > t.choose_item('Drink')
 => "Drink x1 = £3.50"
2.4.0 :006 > t.choose_item('Drink')
RuntimeError: Item already in order, please remove it first
2.4.0 :007 > t.delete_item('Drink')
 => [{:item_name=>"Pizza", :price=>"11.95", :quantity=>2}]
2.4.0 :008 > t.view_order
 => "Pizza x2 = £23.90"
2.4.0 :009 > t.view_total
 => "The grand total is £23.90"
2.4.0 :010 > t.place_order
 => "Order placed!"
2.4.0 :011 > t.view_order
RuntimeError: Please select an item first
```

![text confirmation](/docs/message-confirmation.jpg)

## User Stories

These were the user stories used to guide the project:

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
