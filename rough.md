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
# IRB

takeaway = TakeAway.new

A RESTAURANT
> to see the menu enter          'menu'
> to place an order enter       'order'
> to see your basket enter     'basket'
> to empty your basket enter    'empty'
> to checkout enter          'checkout'
> to exit hit Return twice

'menu'
Prints menu

'order'
Please enter the dish name:
[to finish, hit Return twice]

Please enter the quantity:

-- 3 burger(s) have been added --
Please enter the dish name:
[to finish, hit Return twice]

# to be done
[Sorry, I didn't understand that input. Please try again] 