require './lib/takeaway.rb'
require './lib/text.rb'

class Order

  include Text

  attr_reader :current_order

  def initialize(takeaway = Takeaway.new)
    @current_order = {}
    @takeaway = takeaway
  end

  def show_menu
    @takeaway.menu
  end

  def show_current_order
    @current_order
  end

  def add(food, quantity = 1)
    raise("Select a item from the menu") if !on_menu(food)
    puts "#{quantity} #{food}(s) added to your basket"
    @current_order[food] = quantity
  end

  def on_menu(food)
    check_against = @takeaway.menu.keys
    check_against.include?(food)
  end

  def total
    food_keys = @current_order.keys
    array_of_prices = food_keys.map {|food| @current_order[food]*@takeaway.menu[food]}
    array_of_prices.inject(0){|sum,x| sum + x }
  end

end
