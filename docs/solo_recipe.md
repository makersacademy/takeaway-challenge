# Ordering Dishes Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

Done using excalidraw. Screenshot saved on desktop
https://excalidraw.com/#json=MIuTJ03jOfS0ELMhfeMaS,JY-rts0QKQdBcqjbLcHxlA

_Also design the interface of each class in more detail._

```ruby

class Menu

  def initialize
    @menu = {}
  end

  def add(dish)
    dish.each do |dish, price|
      @menu[dish] = price
    end
  end

  def list
    menu = @menu.map do |dish, price|
      "#{dish.dish}: £#{price.price}"
    end
    return menu
  end

end

class Dish
  def initialize(dish, price)
    @dish = dish
    @price = price
  end

  def dish
    @dish
  end

  def price
    @price
  end

end

class Order

  def initialize
    @dishes = {}
  end

  def add(dish)
    dish.each do |dish, price|
      @dishes[dish] = price
    end
  end

  def check_dishes
    my_dishes = []
    @dishes.each do |dish, price|
      my_dishes << dish
    end
    return my_dishes
  end

  def check_price
    my_prices = []
    @dishes.each do |dish, price|
      my_prices << price
    end
    return my_prices
  end

  def print_receipt
    order = @hash.map do |dish, price|
      "#{dish}: £#{price}"
    end
    return order
  end

end

class ConfirmationText

  def initialize
  end

  def add(receipt)
  end
  
  def send_text
  end

end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# integration for Menu and Dish

# Add dishes to the menu and print the menu
menu = Menu.new
dish_1 = Dish.new("Soup", 5.99)
dish_2 = Dish.new("Pizza", 9.99)
dish_3 = Dish.new("Cake", 4.99)
menu.add(dish_1)
menu.add(dish_2)
menu.add(dish_3)
expect(menu.list).to eq [dish_1, dish_2, dish_3]


# integration for Order and Dish

# Add dishes to my order and check dishes
order = Order.new
dish_1 = Dish.new("Soup", 5.99)
dish_2 = Dish.new("Pizza", 9.99)
dish_3 = Dish.new("Cake", 4.99)
menu.add(dish_1)
menu.add(dish_3)
expect(order.check_dishes).to eq [dish_1, dish_3]

# Add dishes to my order and check prices
order = Order.new
dish_1 = Dish.new("Soup", 5.99)
dish_2 = Dish.new("Pizza", 9.99)
dish_3 = Dish.new("Cake", 4.99)
menu.add(dish_1)
menu.add(dish_3)
expect(order.check_prices).to eq [dish_1, dish_3]

# Removes dishes from my order
order = Order.new
dish_1 = Dish.new("Soup", 5.99)
dish_2 = Dish.new("Pizza", 9.99)
dish_3 = Dish.new("Cake", 4.99)
menu.add(dish_1)
menu.add(dish_3)
menu.remove(dish_3)
expect(order.check_dishes).to eq [dish_1]

# Add dishes to my order and print receipt
order = Order.new
dish_1 = Dish.new("Soup", 5.99)
dish_2 = Dish.new("Pizza", 9.99)
dish_3 = Dish.new("Cake", 4.99)
menu.add(dish_1)
menu.add(dish_3)
expect(order.print_receipt).to eq "Soup: £5.99, Cake: £4.99"

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# Unit test for Menu


# Unit test for Dish


# Unit test for Order


# Unit test for Receipt


# Unit test for ConfirmationText

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._

