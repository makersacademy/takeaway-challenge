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

This is a suite of classes which can be used to mimic a take away service. 

There is a menu class for the customer to peruse what's on offer. The customer can choose the dishes they want and add them to an order, once satisfied with their selection they can get a view of the ordered items including total price. When the customer confirms their order a confirmation text will be sent to the customer.

There is also unfinished functionality regarding a listening SMS server (OrderServer), this server on receiving a text with order details will then generate an order via the OrderManager

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

## Sending a Text
If you wish to run the SMS service for real and test the send process in the feature tests, do the following:

* Ensure Twilio is configured on your machine - There is a guide here https://www.twilio.com/docs/sms/quickstart/ruby
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

## Receiving a Text
The order server is very much a work in progress. However if you wish to send a text this can be achieved manually by doing the following:

In a new terminal run 
~~~~
twilio phone-numbers:update "<Twilio phone number here>" --sms-url="http://localhost:4567/receive_order"
~~~~
This will create a tunnel to an external site and effectively mimic your local machine as an external server accepting POST requests from Twilio

You will see this in your terminal if it's woking 
~~~~
SID                                 Result   SMS URL                                          
PN7a51b877ef42145566170283b95dff81  Success  https://a5bd-88-110-42-114.ngrok.io/receive_order
ngrok is running. Open http://127.0.0.1:4041 to view tunnel activity.
Press CTRL-C to exit.
~~~~


Run `./lib/order_server.rb` as a stand alone application.. I use VS Code and right click the file and choose run code as the option. You could call directly from another terminal with `ruby './lib/order_server.rb'`

This will start the Sinatra server. You will see this if it works ok
~~~~
Puma starting in single mode...
* Puma version: 5.5.2 (ruby 3.0.0-p0) ("Zawgyi")
*  Min threads: 0
*  Max threads: 5
*  Environment: development
*          PID: 11690
* Listening on http://127.0.0.1:4567
* Listening on http://[::1]:4567
Use Ctrl-C to stop
~~~~

Now all you have to do is send a text to your Twilio number. 

text format is a comma seperate string of menu_item,quantity_to_order e.g Spagbol,1,Cottage Pie,2

I have not put any checking on this to see if the format is correct!




----------------------------------

## Project Structure
All spec test files reside in the `./spec` directory
Please note that the `feature_spec.rb` file resides in the `./spec/features` directory

All code files reside in the `./lib` diecrtory

All documentation files reside in the `./doc` directory

All data files reside in the `./data` directory

As mentioned environment data is stored in the root in a `.env file`

----------------------------------
