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

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Run 'rspec' to run the tests
* Or: Require each file and test is manually on IRB

Helpful Links
-------

* https://www.twilio.com/docs/sms/quickstart/ruby : is the link that guided me through creating TwilioClient class.
* https://medium.com/rubycademy/the-env-object-6ffa6ed9a63c : setting env variables on IRB
* https://dev.to/kcarrel/major-key-alert-hide-your-api-keys-l4c : adding .env file to gitignore
* https://medium.com/@dhairyapunjabi/testing-codes-that-interact-with-standard-input-and-output-in-ruby-4710fec8ebbf : To mock "$stdin"

Approach
-----

* My approach was to tackle story by story visualizing how i would like the code to work.
* I wanted it to be interactive but did not yet know how to mock or test the input.
* Hence, the first code was all automated, later I introduced user input in the entry_point file, which is the entry_point for the whole program.
* Twilio account_id and auth_token are stored in the .env file.
* I did not feel it is necessary to mock every test, but i have mocked certain $stdin's and the twilio tests to not send a message everytime I run rspec.
* entry_point : takes the phone number and order, calls add_order, calls generate_bill, once the bill is generated and displayed complete it also asks if the customer is happy to continue with the order. If "yes" order is accepted and the delivery message is sent.
* Order Class : Adds the taken order
* Menu class : generates a menu_card
* Bill class : calculates the toal amount and generates the bill
* TwilioClient class : send the message
s.

Notes on Test Coverage
------------------

* You can see your [test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) when you run your tests.
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
