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

#Makers Academy weekend challenge #2

##Instructions

[add these when you have internet]

##Approach

I tackled the user stories in the below order:

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

I knew straight away that I would want a "Takeaway" class for the user to interact with, and that class would need to communicate with a "Menu" class (which would be responsible for storing and printing the list of dishes and prices) and an "Order" class (which would be responsible for all things relating to the order - storing the order, adding to it and working out the summary and total).  I diagrammed how the classes would interact and what kind of methods I would need to implement before setting up the Menu class and the #show_menu method.

I then built the #add_to_order method, including a guard case for if the user tried to order a dish which was not on the menu and making sure it increased the current total of the dish, in case the user wanted to add more later.

Next I built the #basket_summary and #total methods, having the Order class work these out by referring to the Menu class for prices.  The code for actually calculating and displaying the basket_summary output is something I would improve had I spent more time on this challenge - I feel there is a much cleaner and more elegant way to do it.

Once the functionality of showing the menu, adding to the order and displaying the totals was implemented, I developed the #checkout method which tells the Order class to check that the given total is correct, and then simply returns `true` if it is, which allows Takeaway to put sending the confirmation SMS into action.

I used the [twilio-ruby](https://github.com/twilio/twilio-ruby)] gem for sending the SMS and [Dotenv](https://github.com/bkeepers/dotenv) for hiding the telephone numbers and auth token.  The actual SMS which is sent is quite basic and simply uses the #basket_summary message in the output - this is another thing I would like to improve to make the SMS more readable and professional-looking.  I used `strftime` to format the time and simply Time.now + (60*60) to generate the time one hour from placing the order.

Given more time I would like to implement the functionality to clear the order once it has been placed, show the order details in the output as well as in the SMS message and refactor some of the methods which seem a bit too lengthy to me - it was tempting to enable multiple orders and menus to be used in the program, but I opted with satisfying the user stories over implementing these.  Also, some of my method and variable names could use some improvement - Order's @list variable, for instance - I considered calling it @dishes, but didn't want to confuse it with that of Menu's @dishes, so left it as it was, but this and some others need to be made more clear on what they are.
