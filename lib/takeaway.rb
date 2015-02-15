require './lib/order'
require './lib/menu'
require './lib/dish'
require './lib/twilio'

class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new('Lunch')
    @order = Order.new('+447595593385',menu)
  end

  def build_menu
    menu.add(Dish.new('Pizza Margarita','Main',8))
    menu.add(Dish.new('Pizza Americana','Main',11))
    menu.add(Dish.new('Pizza Funghi','Main',12))
    menu.add(Dish.new('Pizza Quattro Fromagi','Main',13))
    menu.add(Dish.new('Pizza Sloppy Joseppe','Main',12))
    menu.add(Dish.new('Garden Salad', 'Starter', 4))
    menu.add(Dish.new('Ceasar Salad', 'Starter', 6))
    menu.add(Dish.new('Beef Carpaccio', 'Starter', 8))
    menu.add(Dish.new('Chocolate Fondant', 'Dessert', 5))
    menu.add(Dish.new('Strawberry Cheesecake', 'Dessert', 5))
  end

end

