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

Task
-----
This challenge was a solo challenge for Week 2 of Makers Academy. Below are the user stories to be fulfilled by the project. 

## User stories:

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
## Usage
* Fork this repo
* Run 'bundle'
* Register an account at Twilio
* Store Twilio details and phone numbers in environmental variables

### My approach to the challenge

I began spending time looking at the user stories and created a sequence diagram (available in this repo) which helped me to begin the creation of my classes.

I tried to adhere to the Single Responsibility Principle with my classes.


### Reflection

I am pleased with how I approached diagramming with this challenge compared to the last one. Rather than considering domains and using those to determine my classes, I considered the messages that needed to be sent and to which objects they would be sent. 

Having looked backed at the requirements, I can see that my text message needs to be updated to include the exact time of delivery. 

In retrospect, I would have run Rubocop more frequently. I just ran it at the end and have numerous offenses that could have been avoided earlier on. 

There are some parts of my code which I could DRY out, for example, #show_basket and #see_menu – two methods in two different classes. I wonder whether these could be abstracted out to a module.

I would include some more instructions on how to use the program in IRB.

I would like to increase my test coverage to 95%.