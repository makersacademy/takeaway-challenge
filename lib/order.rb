require './lib/takeaway.rb'

class Order

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

  def add(food, quantity)
    raise("Select a item from the menu") if !on_menu(food)
    @current_order[food] = quantity
  end

  def on_menu(food)
    check_against = @takeaway.menu.keys
    check_against.include?(food)
  end

end
