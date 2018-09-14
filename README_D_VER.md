# __Outline__

Build a working takeaway app:

  Using the Twilio API, the app should contain a list of 'dishes' with 'prices'.
  It should take their 'quantities' and return a number that should be the 'exact total'. If the 'sum' is not correct the method should 'raise an error', otherwise the 'customer' is sent a 'text' saying that the 'order was placed successfully' and that it will be 'delivered 1 hour from now', e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  Takeaway is thoroughly tested and uses mocks and/or stubs, as necessary to not to send texts when your tests are run
  Takeaway in IRB when an order is placed should actually send a text.

---
---

## User Stories
---
#### Step 1
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

#### Step 2
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

#### Step 3
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

#### Step 4
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

---

## Feature Tests