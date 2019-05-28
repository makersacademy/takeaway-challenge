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

Instructions
-------
Install the gem to load environemt variables from .env file:
```
gem install dotenv
```

* Run the command 'bundle' in the project directory to ensure you have all the gems
* Takeaway program implements the following user stories:

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

  * The Application uses text sending functionality Twilio API.
  * There is 100% test coverage and rubocop is happy
  * When Takeaway app is loaded into IRB, the order is placed, the text is sent
  * The application uses .env file to hide auth token for twilio account


* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

[Instructions](https://github.com/makersacademy/takeaway-challenge)
