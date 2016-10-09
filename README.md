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
* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning


Installation Instructions
-------
Fork and clone this repo.
Run bundle to install the gems named in the Gemfile.
Takeaway can be run using IRB or Pry.

```
require './lib/customer'

[1] pry(main)> require './lib/customer'
[2] pry(main)> cust = Customer.new
     ## will print menu
[3] pry(main)> cust.select_dish
Please enter a menu choice:
14
=> [["14", "ultrices phasellus", "5.52"]]
[4] pry(main)> cust.select_dish
Please enter a menu choice:
16
=> [["14", "ultrices phasellus", "5.52"], ["16", "in felis eu", "6.28"]]
[5] pry(main)> cust.confirm_order
The total for your order is £11.80.
=> <Twilio::REST::Message @path=/2010-04-01/Accounts/AC9418dc2fc0bb5cbb33e505c227d3a3c1/Messages/SMad1e6b07eaf84bf48940e5b0720ba53c>
```

Outcome
-------
Testing this weekend went out the window (blaming a weekend in London for this one).

What I was able to do:

- Create Menu class to load a menu from a csv file.
- Create Customer class to allow a customer to select dishes and add it to an order.
- Create Order class to receive an incoming order and total it up.
- Create ConfirmationTextSender class which used the Twilio API to send text confirmation to the user.

What I wasn't able to do (yet - could do this with more time):

- Create a 'helper' class that mocks user input and tests it.
- Create guard clauses that throw errors when user inputs incorrect dish.
- Currently dishes are listed by number but I can implement functionality to type the name of the dish in and do a search for that item.
- Allow ConfirmationTextSender to send the full order to the customer.
- Allow the user to send orders via text.
- Couldn't get rspec to load. Possibly something to do with the twilio gem. Rspec runs when twilio is required, but will not work in irb. Rspec fails when twilio-ruby is required, however this does work in irb.
- Generally tidy it up a lot. 
