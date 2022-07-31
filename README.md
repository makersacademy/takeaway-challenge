# Takeaway Challange

Implementation of an take-away restaurant.

## Getting started

Clone the repository to your local maschine and install GEMs with bundle from top level folder:

`git clone https://github.com/michael-zwickler/takeaway-challenge`

`bundle`

Create a `.env` file and store your TWILIO Information in there:

TWILIO_ACCOUNT_SID='XXXX...'

TWILIO_AUTH_TOKEN='XXXX...'

MY_PRIVATE_NUMBER='+4917...'

MY_TWILIO_NUMBER='+185...'

## Usage

Run in IRB from your Terminal in Root Path.

`require_relative 'lib/restaurant'` 
- loads the class + required subclasses

`resto = Restaurant.new` 
- Creates a new restaurant with a sample implementation of the menu. A menu could also be handed in as an argument

`resto.show_menu` 
- Shows the menu of the restaurant

`resto.create_order` 
- Creates a new order

`resto.add_dish_to_order('Chips')` 
- Adds a dish to the order, if it is in the menu

`resto.show_order` 
- Shows your current basket

`resto.submit_order` 
- Finishes the order ands send a confirmation per SMS

## Running tests

Running RSpec in Terminal:

`rspec`
