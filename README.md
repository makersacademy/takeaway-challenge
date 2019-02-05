# Takeaway Challenge

Makers Week 2 (Friday) - This project is an app to order takeaway.

## Getting started

In the location of your choice, in Terminal:

`git@github.com:alittlecross/takeaway-challenge.git`

In that same location, in Terminal:

`bundler`

## Usage

In that same location, in Terminal:

`ruby app.rb`

The Terminal window should look like this:

<img src='images/a.png' alt='welcome' width='400'>

A message will be shown if entering something that does not match the menu:

<img src='images/b.png' alt='welcome' width='400'>

Once an item has been entered, quantity will be asked for:

<img src='images/c.png' alt='welcome' width='400'>

Zero cannot be entered as an answer:

<img src='images/d.png' alt='welcome' width='400'>

Item and quantity entered will be displayed under the menu, also showing the total:

<img src='images/e.png' alt='welcome' width='400'>

Multiple items can be added to an order:

<img src='images/f.png' alt='welcome' width='400'>

'Checkout' asks for the customer's mobile number so a text message can be sent:

**(Note: the application will only send a message if my mobile number is entered.)**

<img src='images/g.png' alt='welcome' width='400'>

The app will close, thanking the customer for visiting:

<img src='images/h.png' alt='welcome' width='400'>

...and the text message will be sent to the customer:

<img src='images/i.png' alt='welcome' width='400'>

The customer cannot checkout if they have not added anything to their order:

<img src='images/j.png' alt='welcome' width='400'>

## Running tests

In that same location, in Terminal:

`rspec`

## Linting

In that same location, in Terminal:

`rubocop`
