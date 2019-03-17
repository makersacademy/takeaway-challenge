```
  _______    _                                     _____ _           _ _                       
 |__   __|  | |                                   / ____| |         | | |                      
    | | __ _| | _____  __ ___      ____ _ _   _  | |    | |__   __ _| | | ___ _ __   __ _  ___ 
    | |/ _` | |/ / _ \/ _` \ \ /\ / / _` | | | | | |    | '_ \ / _` | | |/ _ \ '_ \ / _` |/ _ \
    | | (_| |   <  __/ (_| |\ V  V / (_| | |_| | | |____| | | | (_| | | |  __/ | | | (_| |  __/
    |_|\__,_|_|\_\___|\__,_| \_/\_/ \__,_|\__, |  \_____|_| |_|\__,_|_|_|\___|_| |_|\__, |\___|
                                           __/ |                                     __/ |     
                                          |___/                                     |___/      
                                          
```                                     
Takeaway challenge is a program run in REPL. It allows a customer to view a menu, build an order, check the price of the order and place an order. Reference has been made to the following repository: [Takeaway-Challenge](https://github.com/amyj0rdan/takeaway-challenge)

[See here](https://github.com/makersacademy/airport_challenge) for Makers' original repo.

### Getting started

Fork or clone this repo:      
`git clone git@github.com:arthurashman/takeaway-challenge.git`    
`gem install bundle`     
`bundle`     

### Usage

Run in `irb`     
Requires Twilio account to be set up [Login or signup here](https://www.twilio.com/login?g=%2Fconsole%3F&t=2b1c98334b25c1a785ef15b6556396290e3c704a9b57fc40687cbccd79c46a8c). Add the following from your Twilio dashboard to an `.env` file at the project root:     
TWILIO_NUMBER = 'YourTwilioPhoneNumber'     
TWILIO_ACCOUNT_SID = 'YourTwilioAccountSID'     
TWILIO_AUTH_TOKEN = 'YourTwilioAuthToken'     
PHONE_NUMBER = 'YourVerifiedPhoneNumber'

### Testing

`rspec`

## User stories

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
## Approach

Taking direction from the user stories, I constructed a domain model class diagram for Takeaway, Menu, Order and SMS.
I used a TDD approach to fulfil the user stories and build out the necessary methods as discovered in the class diagram.
Utilising the twilio documentation, I attempted to understand and integreate the api to send a text upon order being placed. 
I would like to understand the api call better and finish setting this up, as well as extracting the order class.
