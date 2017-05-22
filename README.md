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

SMS2Eat
-----

I've used Twilio API to create a system that enables users to order food by SMS. It's very simple and the menu options is not very dynamic, but I had a lot of fun doing it.

I've used Sinatra to get the HTTP requests sent by Twilio and ngrok to create a tunnel to expose my machine to the external requests.

Testing
-----
I had a few problems with testing, and I'm not happy with the coverage of the tests provided. I'm far from happy with the amount and quality of the testing, but due to time constrains I was not able to revert this.


User Stories
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

