require_relative 'order'
require 'csv'

class Dishes

  def initialize(order = Order.new)
    @order = order
    @dishes = {}
    open_menu
  end

  def open_menu(filename = "./lib/list_of_dishes.csv")
    contents = CSV.open(filename, headers: true, header_converters: :symbol)
    contents.each_with_index do |row, index|
      food_type = row[:food_type]
      name = row[:name]
      price = row[:price]
      @dishes[index + 1] = {"Name" => name, "Price" => price}
    end
    contents.close
    @dishes
  end

  def view_menu
    @dishes.each_with_index do |(key, value), index|
      "#{key}. #{value["Name"]} : £#{value["Price"]}"
    end
  end

  def choose_dish(order_no)
    @order.add_to_basket(@dishes[order_no])
  end

  def view_basket
    @order.view_basket
  end

  def place_order
    @order.order_confirmation
  end

end

