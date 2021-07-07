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

treat the Takeaway front face as the main program. (this might be made into a class)
front_menu - user_input to select: show dishes, show order, place order, add to order, leave.

objects         data                      methods

Menu            list of dishes            show dishes
                array of hashes           check is on menu(item)

Item            name, prices             

order           list of dishes ordered    show current order()
                array of hashes           calculate cost of order
                                          add(item, number)
                                          submit order

Need to learn - double check how to do:

formatter                                 format data from order

API - Twilio    phone stuff               interface to utilise Twilio
