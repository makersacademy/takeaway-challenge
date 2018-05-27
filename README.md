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


This project is our second weekend challenge. This week we were focusing on OOP, TDD and diagraming. Completed solo on 27th-27th May 2018). We were given user stories and instructed to write the software for an order management system for a takeaway restaurant. 

## Motivation 

This project has been created for a takeaway restaurant. It will be used by customers to see the menu, order food, check the total price and be notified that the delivery is on the way.  

## Getting started

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

## Usage

Navigate to the root folder in this project directory on the command line to begin. 

Here's a demo of the product, where the user creates a chinese takeaway restaurant, views the menu, creates an order and then adds items to it before submtitting the order. When the user gets the suspected total wrong, an error occurs, but on the correct total being submitted the order goes through and the user recieves a text message sent through the Twilio API! 

<img src="https://imgur.com/OuPI82y" width="100" height="100"/>



## Tech/Framework used 

Built in Ruby (version 2.5.0)<br />
Sends texts using Twilio API 
Tested using Rspec (version 3.7) 
Uses webmock gem to stub out the twilio external https call

## Running tests

run `rspec` from the projects root directory. 

## Credits 

With thanks to Twilio for their awesome API! 

## Skills I used creating thing project 

* TDD
* Using an external API
* Stubbing, mocking and isolated unit tests (although still a long way to go on this!)
* Dependency Injection

