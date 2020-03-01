Takeaway Challenge
==================

Pizza, pizza my kingdom for a pizza

This program simulates your favourite local pizza delivery service.

## Instructions

Clone or download files. Then:

To run unit tests
```
rspec
```
To run feature tests

```
irb -r feature_test.rb
```

## Requirements were:
-------

* Create an interactive program that let's a user order food from a takeaway shop
* The customer should be able to check the running total of their order against the sum of the dished they have added to their order
* Use rspec to test the program using mocking and any other isolation testing mechanisms to unit test each class
* Incorporate dependency injection, encapsulation, polymorphism and other relevant OOP concepts to implement the program
* Use the twilio API to send messages to your customers when their order has been completed


## Approach

### Domain model

| Objects                     | Methods       |
| ----------------------------|:-------------:|
| List of dishes with prices  | View | $1600  |
| Dish                        | select/add    |
| Order (sum of dishes)       | check_total   |
| Text message                | send          |


### Plan of attack (pseudocode)

Menu Object - displays a menu  with a list of items to choose from

```
initialize()
menu_items = [{:item => "Mushroom Pizza", :price => 10} etc, etc]
end

# shows the menu to the user:

view_menu
menu_items each do
puts item, and item price
end
```
___________________

Order Object - contains a list of items the user has selected and checks the price against the menu.

```
initialize(menu = menu.new)
order_items = []
order_total =
menu = menu
end

# adds a dish to the order items

add(dish, amount)
 order_items << {:item => dish, :price => amount}
 puts you have '#{order_items.count} items in your order'
end

#checks to see if the total of the order items matches to the price of the items on the menu

check_total
   sum(order_items) == sum(menu.menu_items)
end

checkout(message = Message.new)
  if check_total = true
    message.send
  else
    raise error
  end
end

private

sum(items)
  for each item do
    adds up the keys
  end
end
```

________________

Message object

```
initialize()
  message = "Thank you for your order"
end

send
  ../send_sms.rb
end
```

__________________

Takeaway Object

```
initialize(menu = menu.new)
 menu = menu
 current_order
end


# lets the user select items and add them to an order
this method can sit up here and then object can inherit and use polymorphism?
add(dish, amount)
  current_order.add(dish, amount)
end

checkout(current_order)
  current_order.checkout(message)
end

```
___________________

## User stories:

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

## Aim

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

## Added inheritance

To streamline my methods I have let the takeaway object inherit the #view_menu method from Menu and let the Order object inherit the #add method from takeaway. I've also used dependecy injection to create instances of menu and order in takeaway's #initialize method. Its #add method uses the decorator pattern to achieve polymorphism.

## Checking dishes

As part of the 3rd user story I've added a check dish method to the Takeaway object. This method checks to see if the name of th e dish that is being added to the order exists on the menu. If not it raises an error.

Feature test:

```
takeaway = Takeaway.new()

takeaway.view_menu

takeaway.add("Garlic Bread", 2)
takeaway.add("Diavola", 1)
takeaway.add("Romana", 2)
takeaway.add("Goat", 1)

puts takeaway.check("Diavola")

puts takeaway.current_order.inspect

```

Luckily with this method in place you are unable to add a Goat to the order.

```
Garlic Bread: £5
Dips: £3
Margherita: £7
Frutti di Mare: £11
Romana: £10
Americana: £11
Padana: £9
Calzone: £12
Diavola: £12
You have added 2 Garlic Bread to your order
You have added 1 Diavola to your order
You have added 2 Romana to your order
Traceback (most recent call last):
	1: from feature_test.rb:12:in `<main>'
/Users/student/Documents/projects/takeaway-challenge/lib/takeaway.rb:16:in `add': Dish is not available (RuntimeError)
```
