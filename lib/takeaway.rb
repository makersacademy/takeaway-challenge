# for rspec testing
require './lib/menu'
# for irb testing
# require './menu'

class Takeaway

  attr_reader :basket, :total_order

  def initialize(menu_list)
    @menu_list = menu_list.price_list
    @basket = {}
    @total_order = []
  end

  def print_menu
    p @menu_list
  end

  def add_to_basket(dish, quantity)
    @basket[dish] = quantity
    @total_order << @basket
    "#{dish} burrito x #{quantity} added"
  end
end

# For running the program in irb
# menu = Menu.new
# takeaway = Takeaway.new(menu)
# takeaway.print_menu
