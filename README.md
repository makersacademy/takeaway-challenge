# Takeaway Challenge

[![Build Status](https://travis-ci.org/micosmin/takeaway-challenge.svg?branch=master)](https://travis-ci.org/micosmin/takeaway-challenge)

![Coverage](badge.svg)

[Task](#task) | [User stories](#stories) | [Clone and run](#clone) | [Details](#details)

## <a name='task'> Task </a>

Week 2 Makers Academy challenge:

Implement a takeaway ordering system with a list of items an ability to send a confirmation message to the user once an item as been selected and ordered

## <a name="stories"> User stories </a>

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

## <a name="clone"> Clone and run the project </a>

```
git clone https://github.com/micosmin/takeaway-challenge.git
cd takeaway-challenge
bundle
rspec
```

Set up a twilio account and create an .env folder to load into the app  
Use the following keys to set it up.  
Follow instructions at https://www.twilio.com/docs/libraries/ruby

```
SID
TOKEN
SENDER_NUMBER
RECEIVER_NUMBER
```

Use Ruby - version 2.5.0

`rvm ruby-2.5.0`

Use bundle to install gem dependencies

`$bundle`

Run the app in terminal

- go to lib folder and run the following command

```
ruby app.rb
```

You will have the following options

```
Select an option:
1. Show menu
2. Select dishes
3. Verify order
4. Submit order
5. Exit
```

App allows you to input the number of the option

Option 1 - Show menu

```
Show menu
1: Onion, Rosemary & Cheddar - 11
2: Smoked Cod’s Roe, Fermented Cabbage & Caraway - 20
3: Duck Sausage & Fennel - 25
4: Nest Soda Bread with Whipped Duck Fat - 10
5: Beetroot & Smoked Eel - 12
6: Scottish Langoustine (+£7) - 10
7: Cornish Halibut, Squid & Mushroom - 8
8: Goosnagh Duck - 10
9: Chocolate & Stout - 13
10: British Cheeses - 15
11: Homemade Oatcakes - 10
```

After each option the menu is redisplayed:

```
...
10: British Cheeses - 15
11: Homemade Oatcakes - 10

1. Show menu
2. Select dishes
3. Verify order
4. Submit order
5. Exit
```

Option 2 - Select dishes

```
Select dishes

Submit selection: use the number of the dish
>
```

- prompt is waiting for user input
- all options below work - app will only take the ones that map to the items in the menu

```
123
1 2 3
123 45
dasda23
fsdfsd 351
```

Once a selection is made the user is presented with the selection and total amount for his order

```
Submit selection: use the number of the dish
fssd 452

Nest Soda Bread with Whipped Duck Fat = 10
Beetroot & Smoked Eel = 12
Smoked Cod’s Roe, Fermented Cabbage & Caraway = 20
Total: 42
```

Option 4 - submit order will send a message to the user's phone

```
Submit order
Order succesfully submitted
```

Twilio message sent to user

```
Thank you! Your order of £42 was placed and will be delivered before 21:24
```

- app takes into account current time and adds 30 minutes for delivery

## <a name="details"> Details about app and process </a>

To develop this application I have followed a strict TDD approach and the RED-GREEN-REFACTOR process.

App has 4 classes and 4 testing spec file corresponding to each class.

Once the main functionality of the app ahs been tested and setup I have refactored the code and extracted several classes: list.rb, dish.rb, messaging.rb. These classes have been tested in isolation by using doubles and stubbing methods where needed in order to force and test behaviour.

I have stuck more than ever tot he principle of testing behaviour rather then state.

Following the SRP principle, I have delegate responsability and attempted to maintain classes cohesive. Though this is a work in progress as further classes can be extracted to make the available classes more flexibile:

- display menu and selected dishes
- calculator to caclulate total based on different VAT regimes

The messaging class has not been throughly tested.

I have not implemented the extra requirement of sending an order via an sms.
