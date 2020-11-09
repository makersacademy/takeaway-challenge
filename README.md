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

## Notes

This challenge saw the first time I implemented an external web API. In order to protect my Twilio account information I added the 'dotenv' gem to my Gemfile and ran bundle install. I then created a .env file in the root of my project directory, and added it to the gitignore file. I added three environment variables to the env file:
```
  export TWILIO_ACCOUNT_SID=***********
  export TWILIO_ACCOUNT_AUTH=*********
  export TWILIO_ACCOUNT_NUM=+********
```
I added the following to the top of my ruby file:
```
  require 'dotenv'
  Dotenv.load
```
To access the information within my ruby program, I called the environment variables using the following syntax:
```
  ENV['TWILIO_ACCOUNT_SID']
  ENV['TWILIO_AUTH_TOKEN']
  ENV['TWILIO_AUTH_NUM']
```
Whilst my program does perform the all of the user stories, there are several things that I would like to do moving forward with the project.

-   As it stands, my classes are all very dependent on each other, and my tests cannot work in isolation. I wanted to create a double "menu" class for my tests but ran out of time.
-   Equally, I wasn’t particularly happy with how I test drove the Twilio implementation. In the end I stubbed out the method that calls the service to text, so that RSpec doesn't trigger the program to send a message every time it is run.
-   My program is not very user friendly. I would like to add some sort of command line interface to improve the user experience.
-   Equally, I would like to privatise some of the methods so that they can only be called by other methods within the class.

Whilst I did not manage to create my program with low coupling, this challenge reinforced my understanding of RSpec mocks and doubles.
