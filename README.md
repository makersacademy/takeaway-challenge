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

A takeaway program allowing you to create and manage dishes, menus and orders. Integrates the twilio API to send order confirmations.

### Motivation

This project has been created as part of my journey as a junior developer at Makers Academy.

### Features

- Allows dishes to be created with names and prices.
- Allows menus to be created, consisting of any number of dishes.
- Allows orders to be created from a menu, consisting of any number of any of the available dishes.
- Menus can be listed to see all the items and their costs.
- Order totals can be returned and the items can be listed.
- On order confirmation a confirmation text will be sent using the twilio API.

### Installation

Program developed in ruby 2.5.0

To set up the environment:

```
$ gem install bundler
$ bundle install
```

### How to use?

This program is designed to be used from a REPL, e.g. IRB or PRY. Please run one of these from the command line, and require the dish, menu and order files. The code examples below show some of the uses.

### Code example

Create a menu

```
require './lib/dish'
require './lib/menu'

pasta = Dish.new('Pasta', 5)
bolognese = Dish.new('Bolognese', 5)
salad = Dish.new('Salad', 2)
menu = Menu.new([pasta, bolognese, salad])
```

List menu dishes

```
require './lib/menu'

menu.list
```

Add dishes to order and list them

```
require './lib/menu'
require './lib/order'

order = Order.new(menu)
order.add(pasta, 2)
order.add(bolognese, 2)
order.add(salad, 1)

order.list
```

Find total of order and confirm

```
require './lib/menu'
require './lib/order'

order = Order.new(menu)
order.add(pasta, 2)
order.add(bolognese, 2)
order.add(salad, 1)

order.total
order.confirm
```

This will send a confirmation message using the twilio API. twilio account sid, auth token, phone number and destination phone number must be set as environment variables.

### Tests

Testing was carried out using RSpec. tests can be run from the project home directory:

```
$ rspec
```
