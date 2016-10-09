This is how I started the challenge - thinking about objects and messages and possible code structure.

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

VIEW DISHES --> MENU
ORDER FROM --> MENU
CHECK TOTAL --> MY ORDER
RECEIVE TEXT CONFIRMATION --> MY ORDER

class Menu
  def initialize
    @dishes = {}
  end
  def view_menu
  end
  def select(dish, quantity)
  end
end

class Dish
  attr_reader :name, :price
  def initialize (name, price)
    @name = name
    @price = price
  end

class Order
  def view_order
  end
  def total
  end
  def confirm
  end
end

class Confirmation
  def send_text
  end

  Features to test/build
  1. Create a dish
  2. View menu
  3. Add item to order

  What would an order look like?

  order = Order.new
  order.add_item("Chicken Teriyaki", 1)
  order.add_item("Tuna Sashimi", 1)
  
