# Takeaway Challenge 

## Week 2 Weekend Challenge at Makers

This project was to create a simple takeaway app with text confirmation functiionality, by means of ruby gem Twilio.
This was my first time of using Twilio, the walk-through on the Twilio page was helpful for the written code but I couldn't implement it without @jackmcc08's patience and guidance.

The user stories for the project are as follows: 

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

All the user stories were implemented, except that the "I would like to be able select some number of several available dishes" . My program is only able to order one dish at a time, by typing in its name. I would like to implement adding more than one dish at a time and also to return an error if the dish picked is not on the menu. 

This is how my code behaves in IRB

![image](https://user-images.githubusercontent.com/30720508/111869758-bb83f400-8978-11eb-9a3a-fd6bc5f024c2.png)

Once text_confirmation is called, my phone receives a text with order total and time one hour from now. 

Test coverage: 
![image](https://user-images.githubusercontent.com/30720508/111870050-45808c80-897a-11eb-954d-ef5d55bb0d3e.png)


Credit to @jackmcc08 for the help with Twilio gem 

