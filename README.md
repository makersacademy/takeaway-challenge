# Takeaway Challenge

## Context

Friday challenge for week four of the Makers bootcamp; this weeks objectives were based around object-oriented programming. For the challange we were given the below user stories, included here for reference. Further below is an explanation of my approach and some examples of my code being used.

## Task

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

I read through the user stories and drew up a basic diagram of how I imagined the Classes working and talking to each other:

![Diagram 2](https://github.com/alicegray33/takeaway-challenge/blob/main/docs/diagram2.png?raw=true)

I started testing and coding the List class first, so I could complete the first user story. I used doubles as fake "Dish" objects as I hadn't yet tested-driven a Dish class. 

Although it was not included in the user stories, I had to assume at some point a takeaway worker would create new dishes and add them to the list for a customer to browse. So from here I created the Dish class.

After that I went on to create the Order class which can select different dishes as a meal and then give a total amount for the order.

The fourth user story was the most complex for me as it involved testing that the message replied with the correct/expected time of the order delivery. It also involved the use of the Twilio app. I was able to use a stub to avoid calling the Twilio app during the rspec tests, but the code still works when correctly used in irb:

![Testing SMS on IRB](https://github.com/alicegray33/takeaway-challenge/blob/main/docs/testing_sms_irb.png?raw=true)

![SMS received](https://github.com/alicegray33/takeaway-challenge/blob/main/docs/sms_received.png?raw=true)

The rspec tests all pass with 100% coverage and rubocop is happy.

## Example In Use

Below is an explanation of how this project can be used in irb:

(To come)

## Further Thoughts

Though I have completed all four user stories there is still a lot of room for improvement. As far as object-oriented principles go there is further scope for refactoring in terms of single-responsibility. Some of the Classes and Methods could be further split up such as the Restaurant class that could be split into seperate classes for generating the message and then sending that message to Twilio. But at the moment the Restaurant class does nothing with the "order" that it receives and in a real world environment it may require a takeaway worker to check or acknowledge the order (eg checking those dishes, or the ingredients for those dishes, are complete).

I played around with saving the Twilio credentials in environment variables but I struggled to get them to work how I wanted. I found another gem that would tell Ruby to load those environment variables each time but I ran out of time and didn't implement that. As it stands the variables are stored in an extra .rb file that is excluded from git via the .ignore file. So another user of this project would have to create/replicate the twilio_credentials.rb file as follows:

```
TWILIO_ACCOUNT_SID = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'.freeze
TWILIO_AUTH_TOKEN = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'.freeze
FROM = '+44700013123'.freeze
```

I have also not had any time to test-drive any edge cases, such as sending an order to the restaurant with a dish that doesn't exist.

