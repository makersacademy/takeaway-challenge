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

## Introduction

Takeaway Challenge is a simple Ruby program that simulates a takeaway restaurant user experience via irb and meets the requirements of four user stories ([outlined below](#user-stories))

This is my second weekend challenge on the Makers Academy coding bootcamp: I felt more comfortable writing tests in RSpec this week (although I was still perplexed on a number of occasions, I found it much easier to find solutions or ideas in the documentation or via Stack Overflow etc.) I was also trying to implement what I had learned about encapsulation, testing behaviour not state, and other OOP principles. I think, in this regard, the program is a work-in-progress!

Near the end of this project I merged my Takeaway class with my Order class (the Order class no longer exists) - while I liked the idea of having a separate Order class, there was significant overlap with Takeaway and it was causing me some difficulty in tests. The Takeaway class could probably do with some paring down: the private methods for formatting strings could be extracted to their own class, for example, which would also facilitate testing them. Where the user receives information, such as the menu or the current order status, I have used symbols, so that the user cannot manipulate string, arrays, hashes etc. through irb.

If I had more time on the project, I'd like to go beyond the user stories and implement more features - for example, at the moment a customer cannot delete a dish once it is added to the order. The only way to remove anything is to start over with a new instance of the Takeaway class.

I enjoyed this challenge, especially getting Twilio to work: it was a really encouraging moment when I hit return on my terminal and my smartphone buzzed with a message.

## Installation

```
git clone https://github.com/edpackard/takeaway-challenge.git
gem install bundler
bundle
```
You will also need to save four environment variables into your `~/.zshrc` or `~/.bash_profile` files. In zsh, my variables looked like this, with the required information in the quotation marks.
```
export PHONE_NUMBER=""
export TWILIO_NUMBER=""
export TWILIO_AUTH=""
export TWILIO_SID=""
```
Register for a free [Twilio](https://www.twilio.com/) account and obtain a phone number, authorisation token, and SID. These go in the relevant fields above, the `PHONE_NUMBER` variable should be your own smartphone number.

## How to use this program

Open `irb` from the command line and `require` the `takeaway.rb` file. If you are in the `takeaway-challenge` directory, `require './lib/takeaway'` will open the program.

* To create a restaurant to order from: `takeaway = Takeaway.new`
* To see the menu: `takeaway.view_menu`
* To add a dish: `takeaway.add("<dish name>")`
* The dish name must be on the menu, and must be entered exactly (a future feature could be case insensitivity)
* To check what you have added, and see the total cost: `takeaway.check_order`
* To place your order: `takeaway.place_order`
* You will receive a text message with your delivery time!
* You can still check what you ordered after placing an order, until you add another order
* If you add another order after placing your order, you will begin a new order
* You cannot place an order if you haven't added any dishes

## How to run the tests

To run the RSpec tests, run `rspec` from the `takeaway-challenge` directory. This will run all the unit tests and the feature test. To run individual test files, put the file path after `rspec`, such as `rspec ./spec/takeaway_spec.rb`.

The feature test goes through a series of commands such as `add`, `view_menu`, and `check_order`. It does not use `place_order`, to prevent excessive text messaging. To run the feature test with the `rspec` command, you will need to un-comment out the file.

This program has 100% RSpec test coverage (even with the feature_test_spec.rb file commented out), although it is perhaps 'over-tested' in some regards, and I am not sure about the quality/clarity of some of my mocks.

## User Stories

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