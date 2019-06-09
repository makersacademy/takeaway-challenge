I will need 4 classes:

  Dish - create a new dish with a name & price??
  Menu - list of available dishes
  Order - manage my current order
  Place_Order - check sum is correct & send text confirmation

  Menu will be 5 items long. Each item is a hash, the key is the item name
  & the value is a hash containing the price & later the quantity:

  {
    jollof_rice: { price: 6 },
    fried_plantain: { price: 3 },
    jerk_chicken: { price: 8 },
    vegetable_patty: { price: 4.5 },
    ice_cream: { price: 4 }
  }

Menu
---------
Menu_options - list of items that can be ordered
  order_item - check item is on menu
             - send item to order or raise error

printing menu
  create new order

USER STORY 1
-------------
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

user starts new order
user can see all items in menu
  -> send message to see all menu items
  <- recieve all menu items back

Store menu as hash on Order


USER STORY 2
-------------
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

user starts a new order
choose item from menu
add item & quantity to order
  if current_order is empty - start new order
  calculate cost: item price * quantity
  add item to current order
  add cost of item to total
Rinse + repeat (diff item & quantity)


USER STORY 3 + 4
-------------
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

----------------------------------------------------|
user starts a new order                              
choose item from menu
add item & quantity to order  
  calculate cost: item price * quantity
  add item to current order
  add cost of item to total
place order
  check total == value of current order
    values DON'T match: wrong send error message
    values DO match: send text with confirmation

|----------------|----------------|
    Order            PlaceOrder
|________________|________________|
|                |                |
|                |                |
|                |                |
