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

Instructions
-------

Clone the repository from github the cd in the cloned directory.

```
$ git clone git@github.com:mannieg/takeaway-challenge.git
$ cd takeaway-challenge
```
Load dependencies with bundle.
```
$ gem install bundle
$ bundle
```
Require the application in irb.
```
$ irb
$ 2.3.1 :001 > require './lib/takeaway'
```
Load custom CSV with dishes and prices (optional).
```
$ 2.3.1 :002 > takeaway = Takeaway.new(csv: CsvReader.new(file: "filename.csv"))
```
Twilio API: Will require free account with API key which needs to be added to the text_service.rb
```
https://www.twilio.com/try-twilio
```

Usage Example
-------

```
$ 2.3.1 :002 > takeaway = Takeaway.new

# Will show the full menu available
$ 2.3.1 :003 > takeaway.show_menu

# Provide exact dish name and quantity, note quantity is optional default is one.
$ 2.3.1 :004 > takeaway.add_to_order("Milly Jilly Tarkari", 2)

# Shows current basket
$ 2.3.1 :005 > takeaway.view_basket

# Shows total order amount
$ 2.3.1 :006 > takeaway.view_total

# Takes the total amount of the order by passing the correct amount the order is complete.
2.3.1 :007 > takeaway.confirm_total(15.9)

```


User Stories
---------

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
