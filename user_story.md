As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
----------------
    customer / order meal
    menu / list of dishes with prices

    Restaurant (class) --> Menu (class) --> {dishes, price} (attributes)
-----------------------------------------------------
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
-----------------
    meal --> order
    basket --> select dishes {dish, quantity}

    Restaurant --> Order(class) --> place_order (method) --> take argument of dishes with quantities {dish, quantity}---> basket
-------------------------------------------------------

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
------------------
    basket --> sum of dishes

    Restaurant ---> Order(class) --> order_total (method) ---> basket dish quantity * menu dish prices --> sum of basket
--------------------------------------------------------

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
--------------------
    Restaurant ----> place order (method) ----> twilio class 
    Restaurant(class) ---> Order(class) ----> Messenger(class)
