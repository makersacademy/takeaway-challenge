As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

```
load './lib/takeaway.rb'
menu = Menu.new
menu.show
# => see a menu
```

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

```
load './lib/takeaway.rb'
order = Order.new
order.add('sushi')
# => ["sushi"]
order.add('burger')
# => ["sushi", "burger"]
order.add('pizza')
# => ["sushi", "burger", "pizza"]
```

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

```
load './lib/takeaway.rb'
food = Takeaway.new
food.add_to_order('sushi')
# => ["sushi"]
food.add_to_order('burger')
# => ["sushi", "burger"]
food.add_to_order('sushi')
# => ["sushi", "burger", "sushi"]
food.show_order
# Sushi: £1
# Burger: £2
# Sushi: £1
# Total: £4
```

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

```
load './lib/takeaway.rb'
food = Takeaway.new
food.add_to_order('sushi')
# => ["sushi"]
food.add_to_order('burger')
# => ["sushi", "burger"]
food.add_to_order('sushi')
# => ["sushi", "burger", "sushi"]
food.show_order
# Sushi: £1
# Burger: £2
# Sushi: £1
# Total: £4
food.confirm_order
# receive text on phone confirming order with 1h extra
```