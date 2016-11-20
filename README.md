Takeaway Challenge
==================
```
                    /\
                    /\
                    /\
                    /\
                  _`=='_
               _-~......~-_
              _--~..........~--_
           __--~~......The.....~~--__
  .___..---~~~.....Golden Dragon....~~~---..___,
   `=.___________________________________________,='
      @^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^@
         |  |  I   I   II   I   I  |  |
         |  |__I___I___II___I___I__|  |
         | /___I_  I   II   I  _I___\ |
         |'_     ~~~~~~~~~~~~~~     _`|
        __-~...~~~~~--------------~~~~~...~-__
   ___---~~....................................~~---___
.___..---~~~..........Take Away services!.......~~~---..__,
`=.__________________________________________________________,='
@^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^@
     |   |    | |    |  |    ||    |  |    | |    |   |
     |   |____| |____|  |    ||    |  |____| |____|   |
     |__________________|____||____|__________________|
   _-|_____|_____|_____|__|------|__|_____|_____|_____|-_  ____

 ```

Task
-----

* A Takeaway program with the following user stories:

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

My approach to solving the challenge:
-------------------------------------

*





Functionality to implement:
---------------------------

  * A list of dishes with prices

  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".

  * The text sending functionality should be implemented using Twilio API.

  * Twilio-ruby gem to access the API

  * Gemfile to manage your gems

  * Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run

  * If your Takeaway is loaded into IRB and the order is placed, the text should actually be sent

  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

  **Advanced! (have a go if you're feeling adventurous):**
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
