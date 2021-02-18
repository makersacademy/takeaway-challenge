[![Build Status](https://travis-ci.com/kerisic/takeaway-challenge.svg?branch=master)](https://travis-ci.com/kerisic/takeaway-challenge)

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
##  About the challenge
This is a Makers Academy week 2 weekend challenge. We are building a takeaway app that fulfils the below user requirements.

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
### Getting Started
* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Register an account at Twilio if you do not already have one
* Create an .env file to store your Twilio details and phone numbers to be used for the texting functionality of this app.

### Usage
* `t = Takeaway.new` Begin with creating a new Takeaway instance
* `t.show_menu` Have a look at the menu for what is on offer
```
{"katsu curry"=>7.5, "nanban chicken"=>7.5, "tonkotsu ramen"=>10.0, "nasi lemak"=>8.0, "mapo tofu"=>7.5, "massaman curry"=>8.0, "
karaage chicken"=>5.0, "korean fried chicken"=>5.0, "soju"=>6.0, "iced tea"=>3.0}
```
* `t.order('katsu curry', 2)` Order a dish by its name and desired quantity
```
"2 x katsu curry has been added to your basket"
```
* `t.basket_summary` Display the basket summary of items in quantity and price
```
"katsu curry x 2 = 15.00"
```
* `t.show_total` Show the basket current cost total
```
"Total: £15.00"
```
* `t.checkout(price)` Checkout the order and receive a text confirming estimated delivery time
```
Thank you for your payment! Your delivery will arrive before 07:23 PM
```

### Notes
This app consists of the main `Takeaway` class - which allows the user to input the above described methods, the `Menu` class - which allows Takeaway to invoke the menu-display and associated methods, the `Basket` class - which acts as a container for ordered items and its pricing information to be accessed later, and finally, the `Texter` class - which sends a text to the customer to inform them of their estimated delivery time.

The texting functionality is created using Twilios API. To obtain the credentials needed, an account needs to be registered on their website, where the Auth Token and Account SID can be accessed. These information will need to be stored as `ENV` variables within the working directory. By using bundle, you will install the `sinatra`, `dotenv` and `twilio-ruby` gems which will support Texters send_text method. 

### Reflection
I believe some of the methods in Takeaway can be extracted further. I am also unsure if the rspec tests are currently appropriate and whether if they are truly testing behaviour, not state. While I have endeavoured to used doubles in them and the tests do their job, they look a little messy right now! Any feedback on encapsulation and dependency injection would also be most appreciated.
