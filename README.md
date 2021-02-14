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
Begin with creating a new Takeaway instance
 `t = Takeaway.new`
Have a look at the menu for what is on offer
`t.show_menu`
Order a dish by its name and desired quantity
`t.order('katsu curry', 2)`
Display the basket summary of items in quantity and price
`t.basket_summary`
Show the basket current cost total
`t.show_total`
Checkout the order
`t.checkout(price)`
### Notes
This app consists of the main `Takeaway `class - which allows the user to input the above described methods, the `Menu` class - which allows Takeaway to invoke the menu-display and associated methods, the `Basket` class - which acts as a container for ordered items and its pricing information to be accessed later, and finally, the `Texter` class - which sends a text to the customer to inform them of their estimated delivery time.

The texting functionality is created using Twilios API. To obtain the credentials needed, an account needs to be registered on their website, where the Auth Token and Account SID can be accessed. These information will need to be stored as `ENV` variables within the working directory. By using bundle, you will install the `sinatra`, `dotenv` and `twilio-ruby` gems which will support Texters send_text method. 
