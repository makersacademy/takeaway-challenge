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



Task:
-----

Was to write a Takeaway program with the following user stories:

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



In the process of working on the solution I have achieved:

* All tests passing
* Average test coverage: 94%; mainly because of long test code for text sending feature.
* The code is elegant: rubocop accepts the code to be clean. 
* All classes are tested in isolation, with suitable doubles and stubbs performed.
* The classes are coherent and are linked by the use of forwarding or dependency injection.

Examplar usage of the code:
-----

Below, you can find an examplar way in which end user could interact with the code in `irb`.


![](/irbshot.png)

The text shot displays the result of the use of: `order_instance.confirm_order(phone_number)` command.

![](/textshot.jpeg)


Running the code:
-----
Before runing, `bundle` the `Gemfile`. 

In order to run the code, when starting a new command line session, you will have to declare `ENV['VAR']`'s for:

* Twilio Account SID: `ENV['TWILIO_ACCOUNT_SID']`
* Authentication Token: `ENV['token']`
* Twilio Phone Number:  `ENV['num']`

To safe `ENV['VAR']`'s for the session, follow this syntax: `KEY=VALUE`
