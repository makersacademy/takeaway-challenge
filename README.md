Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Overview
-------

* This task was a weekend challenge for the second week of my Makers bootcamp.
* We received user stories, and were asked to create a takeaway program to meet the requirements of these stories.
* I implemented the code in Ruby in line with the principles of TDD.
* The external Twilio API was used to send a text message confirming order.

User stories
-----

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

Approach
-----

I implemented my solution using four main classes.

* Dish: dishes on the menu, which have a name and price.
* Menu: a collection of dishes and associated methods.
* Order: a class that stores dishes a customer wishes to order, and contains relevant methods.
* Takeaway: a class representing the takeaway itself, storing the menu and providing functionality that allows the customer to add items to an order and place the order.

Classes in detail
----

### **Dish**

```
class Dish

  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

end
```
* Simple class that stores name and price attributes.

### **Menu**

```
class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def show
    @dishes.each { |dish| puts "#{dish.name}, £#{dish.price}\n" }
  end

end
```

* The main purpose of this class is to store dishes in an array.
* Dishes can be added using `add` and the whole menu can be displayed using `show`.

### **Order**

```
class Order

  attr_reader :total

  ORDER_TIME = 30

  def initialize
    @items = []
    @total = 0
  end

  def add(item)
    @items.push(item)
    @total += item.price
  end

  def show
    @items.dup
  end

  def check_total
    total = 0
    @items.each { |dish| total += dish.price }
    @total == total
  end

  def message
    message = "Your order has been received and will be delivered by #{(Time.now + (60 * ORDER_TIME)).strftime("%k:%M")}\nOrder details:\n"
    @items.each { |dish| message += "#{dish.name}, £#{dish.price}\n" }
    message += "Total: £#{@total}"
  end

end
```
* This class stores dishes that the customer wishes to order in the `items` array.
* The total cost of all dishes added is contained in the instance variable `@total`.
* `add` adds items to the order.
* `show` displays the order as an array using dup so as not to allow editing.
* `check_total` checks that the `@total` instance variable is the same as the total of all dishes.
* `message` returns a string that tells the customer that their order has been confirmed, provides an estimated delivery time, lists items, and their total.

### **Takeaway**

```
require_relative "menu"
require_relative "order"
require 'dotenv'
require 'twilio-ruby'
Dotenv.load("variables.env")

class Takeaway

  attr_reader :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
    @client = Twilio::REST::Client.new(ENV["TWILIO_ID"], ENV["TWILIO_TOKEN"])
  end

  def show_menu
    @menu.show
  end

  def add_to_order(item)
    fail "Item not on menu, please choose something else" unless @menu.dishes.map { |dish| dish.name }.include?(item)
    @menu.dishes.each { |dish| order.add(dish) if dish.name == item }
  end

  def place_order
    fail "Please select some items before placing an order" if @order.show.empty?
    message = @client.messages.create(
    body: @order.message,
    to: ENV["MY_NUMBER"],
    from: ENV["TWILIO_NUMBER"])
  end

end
```
* This is the takeaway interface with which the customer interacts.
* This class is initialized with menu and order parameters, which have default values of `Menu.new` and `Order.new`. This enables either loading a preset menu and/or order (for example, a previously saved order) or defaulting to creating a new menu/order when none is provided.
* `show_menu` displays the menu.
* `add_to_order` adds an item to the order, provided it is on the menu. An error is raised if it is not on the menu.
* `place_order` uses the Twilio API to send a text message to the customer. The content of the message is generated by the `Order` class' `message` function.
* In this class, confidential data is protected using environment variables.