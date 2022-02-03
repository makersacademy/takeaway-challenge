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

-------------------------------------------------------------

Author Notes
-------

This is a program which mimics a take away service. 

There is a menu for the customer to peruse. The customer can choose the dishes they wish to order, once satisfied with their selection they get view of the ordered items including total price. When the customer confirms their order a confirmation text will be sent to the customer informing when it will be delivered.

## Installation

-------------------------------------------------------------
Install gems with [bundler](https://bundler.io/ "bundler") 
~~~~
bundle install 
~~~~
To install code from the latest source
~~~~
git clone git@github.com:nyahehnagi/takeaway-challenge.git
~~~~
Twilio is used for the SMS messaging service.

All unit tests are fully stubbed to prohibit actual calls to the Twilio service. 

If you wish to run the SMS service for real and test the send process in the feature tests, do the following:

* Create a `.env` file in the project root. This project uses the dotenv gem which will have been installed via bundler
* Add the `.env` file to your `.gitignore` file. **You do not want to be commiting this file to github! It will contain real information about your Twilio account/phone numbers used**
* Add the following lines to the .env file

~~~~
TWILIO_AUTH_TOKEN=<your_auth_token>
TWILIO_ACCOUNT_SID=<your_account_sid>
FROM_TELEPHONE_NO=<your twillio number>
TO_TELEPHONE_NO=<your send number>
~~~~

* Activate the pending feature test - User Story 4 - Send a real text in the `./spec/features/feature_spec.rb` file
----------------------------------

## Project Structure
All spec test files reside in the `./spec` directory
Please note that the `feature_spec.rb` file resides in the `./spec/features` directory

All code files reside in the `./lib` diecrtory

All documentation files reside in the `./doc` directory

----------------------------------