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

* Write a Takeaway program following the User Stories shown below.


Setting up the environment
------
1. Clone this repo into to your local machine
2. Run the command gem install bundle (if you don't have bundle already)
3. When the installation completes, run bundle
4. Install Rspec running 'gem install rspec'
5. Set up the project to use Rspec run the command 'rspec --init'
4. Use Twilio API

How to use
-----

* Here are the user stories that we worked out in collaboration with the client

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

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API.

  Task
  -----
  After reading the User Stories, I created a Domain Model drawing an abstract representation of the objects and messages and make more easy the use of feature tests. e.g

```
  2.5.0 :003 > take.show_menu
 1. Paella: £ 7.
 2. Rissotto: £ 8.
 3. Octopus: £ 15.
 4. Salad: £ 6.
 5. Wine: £ 4.
 => {:Paella=>7, :Rissotto=>8, :Octopus=>15, :Salad=>6, :Wine=>4}

2.5.0 :004 > take.place_order("Paella", 2)
Thank you. Your Paella dish was added 2 times to your trolley => nil

2.5.0 :005 > take.sub_total
Total price of 2 dishes of Paella : £ 14.
 => [14]

2.5.0 :006 > take.total_amount
Total price of 2 dishes of Paella : £ 14.
 => "Total amount to be paid £ 14"

2.5.0 :007 > take.complete_order(2)
Total price of 2 dishes of Paella : £ 14.
Traceback (most recent call last):
        3: from /Users/jose/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):7
        1: from /Users/jose/Desktop/makers_week2/takeaway-challenge/lib/takeaway.rb:32:in `complete_order'
RuntimeError (Sorry, sum is not correct)
```

Version
-----
Ruby 2.5.0

Author
----
Jenny Arenas
