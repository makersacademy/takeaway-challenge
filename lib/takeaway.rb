require 'csv'
require_relative 'order'

class Takeaway

  attr_reader :order

  def initialize(menu = CSV.read("./lib/Nandos.csv"))
    @menu_file = menu
    @menu = change_data_type
  end

  def print_menu
    menu.each_with_index { |option, index| puts "#{option.keys[0]}, #{option.values[0]}"}
  end

  def select_dish(dish, amount)
    @order = Order.new if complete?
    order.add(dish, amount)
    "#{amount}x #{dish} added to your basket"
  end

  def complete?
    !order
  end


  private
  attr_reader :menu_file, :menu

  def change_data_type
    menu_file.map { |option| ({option[0] => option[1]}) }
  end
end
