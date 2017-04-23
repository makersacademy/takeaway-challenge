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

This program lets you 'build' restaurants and 'order' food within a ruby repl. It also uses Twilio to send you confirmation text messages. 

## Installation

1. Clone the repository: `git clone git@github.com:adc17/takeaway-challenge.git`

2. Install gems: `cd path/to/dir` then `bundle install`. If `bundler` isn't installed, first run `gem install bundler`.

3. Get Twilio. Sign up for a free account [here](https://www.twilio.com/try-twilio), and tell it you're planning to use **SMS** for building **order notifications** in **Ruby**. It should then walk you through the setup process. Get a Twilio phone number [here](https://www.twilio.com/console/phone-numbers/search). It should all be free with the trial account.

4. My code relies on a few environmental variables—they are TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN, MY_PHONE_NUMBER, TWILIO_PHONE_NUMBER. Make sure you set them before running the code. Your Twilio Account SID and Auth Tokens can be found [here](https://www.twilio.com/console/account/settings).


## Usage

This project is run in a REPL such as IRB (installed with Ruby), or Pry (`gem install pry`). Run `irb` or `pry` from the project root, followed by `require './lib/restaurant.rb'`.

1. Generate a restaurant using `restaurant = Restaurant.new`. By default, this loads up a restaurant with a menu of pizzas defined in `takeawaylist.csv`, but you can specify your own CSV file as an optional parameter when initializing a restaurant. The format expected is simple: one item per line with a comma-separated name and price.

2. Call `#view_menu` on your restaurant to get a simply formatted menu, as below:
```
[2] pry(main)> restaurant.view_menu
                                   MENU ITEMS

--------------------------------------------------------------------------------
Margherita                                                                     6
Napolitana                                                                     7
Québécoise                                                                     8
etc...
```
3. Call `#make_order` to order your food. The code expects a very precise format: `"(item_name) x(quantity), $(total_price)"`. You can order multiple items, just separate them with a comma, e.g. to order three Margheritas and one Napolitana, use `restaurant.make_order("Margherita x3, Napolitana x1, $25")`. If you fail to respect this format, order something that isn't on the menu, or provide a total price that is incorrect, the program will raise an error. 

4. Hit enter, and receive a text message with the estimated delivery time for your order.

## Tests

To test, navigate to the project root and run `rspec`.

## Challenges

1. Confirming that valid input had been passed with `#make_order`. I ended up resorting to some horrible regexps, and I am sorry. I'll try and figure out a better way next time.

2. Domain modelling. Initially, this application had only two classes: `List` and `ListItem`. I decided that it made no sense for lists to process orders, so I remodelled my domain with `Restaurant`s and `Waiter`s. I then realized that waiters overcomplicated everything, as they needed too much access to the restaurant menu to process orders, so I subsumed them into `Restaurant`. Finally, I isolated my interaction with Twilio's API in a separate module, and mixed it into my restaurant class. All this frazzled my brain. However, my RSpec tests helped me no end with the process of refactoring, and that gave me a real taste of the power of TDD. 

3. Line 13 of `lib/restaurant.rb`. I couldn't figure out how to test it, and aside from the Twilio API, it's the only thing my tests didn't cover. I suspect it was just bad domain modelling.

4. Checking the price was accurate. Again, probably bad domain modelling, but I had to match item names entered by the user against item data in my menu, then multiply the quantity of those items ordered by the price for that item on the menu. My solution was even more unclear than that sentence.

5. Twilio. I'd never interacted with an API before, and despite Twilio's being extremely simple, it took me a couple of hours to get everything set up. This included automatically exporting the necessary variables to my `ENV`.

## Improvements

1. RSpec. I think my tests were much neater this week.
2. Simplicity. Horrible regexps aside, I managed to implement the user stories without building a bunch of extra stuff, unlike last week. I'm counting it as an improvement. 
3. TDD discipline. With two small exceptions, I think I wrote all my tests first this week.

## Other notes

Created as my second weekend challenge during the [Makers Academy](http://www.makersacademy.com) Bootcamp.
