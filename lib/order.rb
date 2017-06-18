require_relative './menu.rb'

class Order

  attr_reader :entries, :menu

  def initialize(menu)
    @entries = []
    @menu = menu
  end

  def add_entry(dish_name, quantity = 1)
    raise "Dish not found" unless dish = @menu.get(dish_name)
    quantity.times { @entries << dish }
    @entries
  end

  def total_amount
    "The total amount is £#{@entries.inject(0) {|memo, hsh| memo + hsh[:price]}}"
  end
end
