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

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

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
## Usage

Firstly Clone this repo! Make sure that you run `bundle install` in the repo directory.

In order to use this program, you will need a twilio account.
You must add your twilio credentials to your bash_profile environment variables as follows:

```
export TWILIO_SID=<Your SID>
export TWILIO_TOKEN=<Your Twilio Authorization token>
export TWILIO_NUM=<The number provided in your twilio account>
export MY_NUMBER=<Your personal phone number>
```

Lastly, use `ruby takeaway.rb` from the program's directory to start the program.
This will start a command line script that will ask you to select options in order to make an order.

## My Approach

  I made 4 classes to complete this challenge:

   * Dish
   * Menu
   * Order
   * SMS

 
 #### Dish
 
   The Dish class simply contains attributes for the Name and Price for a given dish, All prices are in GBP:

   ```
     beef = Dish.new("beef", 4)
     chicken = Dish.new("chicken", 3)
   ```
 #### Menu
 
   The Menu Class contains a Hash of the dish names and prices as the key and value respectively.
   Dishes can be added and removed from the menu as you please.

   ```
     menu = Menu.new
     menu.add(beef)
     menu.remove(chicken)
   ```

   You can also check if a dish exists on the menu by passing in a string:

   ```
     menu.available?('beef') #=> true
     menu.available?('chicken')  #=> false
   ```

   Lastly you can print the items available on a given menu:

    `menu.show_dishes`
 
 #### Order
 
   The Order class contains all the logic required to create an order.
   You must pass in a menu object to initialize an order object:

    `order = Order.new(menu)`

   You can also add and remove dishes from the basket, as well as show the
   items currently in the basket and show the total price for these items:

   ```
     order.add('chicken')
     order.add('beef')
     order.remove('chicken')
     order.show_basket # => Chicken: £3
     order.show_total # => Your order total is £3
   ```
 
 #### SMS
 
  The SMS class allows you to use twillio to send an sms when the order is complete.
  Twilio credentials are required to make this work, credentials are loaded as a hash.

  `
    credentials = { "sid": "Your SID", "auth_token": "Your Auth Token", "number": "Your 'FROM' number}
  `

  These credentials must be passed in when making a new instance:

  `sms = SMS.new(credentials)`

  To send a text you will need a recipient number. The message will be passed in as a 'body' paramenter

  `sms.send(body, recipient_number)`

 #### Combining it all together!
 
   The last step was to make a script to tie all these classes together.
   The script asks the user to make a choice in the command line and directs the user to add items and confirm an order.
