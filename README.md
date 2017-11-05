Takeaway Challenge [![Build Status](https://travis-ci.org/cristhiandas/takeaway-challenge.svg?branch=master)](https://travis-ci.org/cristhiandas/takeaway-challenge)
==================

This challenge was made by the MakersAcademy, here you will see the task the setted up for us and how I solved it.
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

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.

To run the program
------------------
* Fork the repo
* Clone it
* run ```bundle``` to make sure you have all the gems
* Go to the text.rb file and set the values asked by Twilio (token, phone, twiliophone and the account_sid) with your own info.
* Then just run:
```
 ruby take_away.rb
```

How I solved it
-----

1- I made a chart, with all the classes and methods that I would need for this challenge.
![chart](/image/chart.jpeg) (Sorry for the hand writing)

2- Started creating a CSV file for the menu, that way It could be changed without damaging the

3- Created the dishes class which basically allows to print the menu and select and specific dish from the menu.

4- I created the order class, this class called functions from the dishes class in order to print the menu in the output and creates a complete order with selecting dishes from the dishes class. It also returns the sum of the prices in order to print the total value.

5- created a take-away.rb file that runs the program, in it the user can print the menu, make multiples orders and check the total price of the order.

6- created the text class that sends a message to the number placed on it, (Right now if you run the program it will fail when trying to send the message, this is because I deleted my info of the text.rb file. I don't know about you but I don't want my phone number on the internet just like that). In order for it to work you must use your OWN twilio account, that way is safer for me.

7- Added a method on the take_away.rb that sends a message when the order is ready.

What made me struggle
-----------------------

- When printing the menu or selecting a food from the menu it would add all the menu all over again, this happened because I was calling the add_menu method in both cases, I solved it by setting the menu equal to an empty array at the end of the method. Yeah, is shameful, I'm not proud of it but it was the easiest solution and I was trying to keep it simple.
- When doing the Takeaway file I struggle a lot with the test, specially when I started to put them as private methods and had to erase the whole file (Yeah, probably not a good idea have all my code "Untested").
- When trying to check the answers from the user such as 'Y/N' had a trouble using .casecmp, so I ended up just using '==' instead.
- When trying to add the send_text method it kept sending me the text to my phone whenever I run the program, It was after 20min of research (Thank's Stackoverflow) that I realised something, I actually haven't created the Text class neither the send_text method in the class, I was just trying to call the file when the order was complete but (not that obvious at the moment) it was reading it whenever I started the program. I solved it just adding "class Text" and "def send_text" at the beginning of the text.rb file. then calling the method in the take_away.rb file.
