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

Summary
-------

This app simulates a take-away ordering service. The user can select a cuisine and then
select dishes from that menu to add to their order. When ready they can place an order and
they should receive a text notification. The app uses Twilio for messaging and the user should
new telephone numbers to match their account.

Getting started
---------------

* Clone this repository
* Install bundler with gem install bundle
* Run bundler with bundle install
* Get a Twilio account and save the SID and auth code as environment variables which are referenced in the message_handler.rb file
* Run the orderer.rb file in a REPL

Commands
--------

* Create a new instance of the orderer - orderer = Orderer.new
* Input which menu you want
* orderer.show_menu - shows menu items
* orderer.add(item number, quantity) - adds an item
* orderer.show_order - show the current order
* orderer.place_order - places the order

Areas for future development
-----------------------------

* Refactor code
* Implement ability to order by text message (Using webhooks?)
* Stub the tests for Twilio properly
* Consider relationship between objects to simplify
* Restructure the ordering process to align with a checkout/payment process

License
-------
License follows the details as shown in the LICENSE file

Contributors
------------
This is primarily the work of George Sykes, but would not have been possible without my fellow developers and coaches at Makers Academy.
