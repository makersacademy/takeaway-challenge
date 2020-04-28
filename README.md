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

 ## questions
 1 -  I was not sure about selecting array or hash for menu_list. I used this demonstration: list={ [id: , dish_name:, dish_price:] ] }. The main reason using this, user selects menu_list_number from the menu. (for example list[1]), and then dish comes inside hash automaticly dish= {id:, dish_name:, dish_price:} which i found useful. Because, user only puts menu list_number instead of typing dish name and then i can easily play with dish using hash advantages(key, value pair). Some of my friends used only hash.
 I think mine is more complicated. How can i do easily ? or Was it correct which i have done ?

 2- About dependency injection: what are the differences between def initialize(s = nil) { @s = s || S.new} and def initialize(s= S.new) {@s = s} and def initialize(s:) { @s = s || S.new}

 3- I created a lot of doubles. Not sure some of them are required or not.

 4- Inside the basket class with the adding function, when it multiplies with value tag, it changes every values which is tagged by price. How can i correct this ? I want to change only the dish which is adding currently.
 for example :
 adding(dish ={id:1, name:pizza, price:1}
 second adding
 adding({id:1, name: kebap, price:2} )
  dish[price:] * 2( 2 is quantity of dish)
  dishes = {{id:1, name:pizza, price:2},{id:1, name: kebap, price:4}}
  I just wanted to change last dish price.

  5- may i get any feedbacks about my code quality, specially about doubles and mocks ( please ignore sms part, i just copied form somewhere)

  thanks you! This is my first time for getting reviews by coaches. I found that writing questions in readme file saves time. Please dm me, if you think i can improve my requesting structure more...  



Welcome Tanil's Restaurant
-------
Unfortunately, we have taken difficult decision to close all(1 so far) Tanil's restaurant in the Uk.
Our top priority is to keep you safe. This shop is now takeaway only. We look forward to seeing you all again as soon as it is safe for us to open. Thank you once again for all your support in keeping one another safe. #stayhome

![IMG_9273](https://user-images.githubusercontent.com/61015092/80338696-e511c980-8854-11ea-93cf-d0fd52000d05.jpg)

Diagram
-------
--will be edit--

Stories
-----

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
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

> :warning: **WARNING:** think twice before you push your **mobile number** or **Twilio API Key** to a public space like GitHub :eyes:
>
> :key: Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.
