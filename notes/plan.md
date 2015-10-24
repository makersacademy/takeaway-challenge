##User Stories

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


Verbs/Noun (messages/object):
See list of dishes (list/dishes and dish)
Select list of ordered dishes (create/order)
Submit list of ordered dishes (submit/order)
Submit total of ordered dishes (verify/order)
Submit mobile phone number (submit/mobile)
Send text message (send/text)

Plan is to incrementally code solution:

stage 1 tests


Test crud for a dish

Test crud for a container of dishes

Test crud for a menu

Test crud for a order

Test show menu


stage 2 tests

Test make an order

Test submit using an order

Test Validate an order

Test reject an order

Test generate accept message

Test accept an order and send SMS accept message


stage 3 tests

test show how to send order using SMS

test receive text message

test create order from SMS message













