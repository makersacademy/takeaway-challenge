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

* Use clone to download this repo
* See Gemfile for description of required Gems
* Use `bundle install` to set required environment
* Production code can be found in lib folder
* Relevant testing in spec folder
* Text sending functionality implemented using Twilio API
* Testing text sending features is possible with `webmock` and `vcr` gems.

Program Takeaway
-------

  * Places the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method raises an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 2 hours from now.





Build status
------------------

[![Build Status](https://travis-ci.org/6eff/takeaway-challenge.svg?branch=master)](https://travis-ci.org/6eff/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/github/6eff/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/6eff/takeaway-challenge?branch=master)

***NOTE
SMS integration is in `send_sms` file. Method not yet stubbed, thus was commented out and isn't used, to prevent sending unnecessary text messages. 
