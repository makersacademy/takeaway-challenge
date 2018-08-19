Takeaway
========

Order food off a menu for delivery. Receive a SMS to confirm delivery time. 
SMS functionality is provided by the Twilio API.

#### Set-up

1) `bundle install`

2) In IRB:
`require './lib/orders.rb'`

#### Create a new order 

`my_order = Orders.new`

#### View the menu 

`my_order.view_menu`

###### This will display a list of the available items and their price

```
Burger & Chips - £7
Donner Kebab - £8
Mystery Curry - £9
Hoisin Duck Pancakes - £10
```

#### Choose your desired dish and quantity

`my_order.choose_dish("Mystery Curry", 5)`

#### View your order

`my_order.view_order`

###### This will display your current items, along with quantity and item price. Total order price will be displayed underneath. 

```
DISH || QUANTITY || PRICE
Mystery Curry || 5 || 9
TOTAL = £45
```

#### Purchase order
`my_order.buy`

###### This will trigger a SMS confirmation, specifying a delivery time.