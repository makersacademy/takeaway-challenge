require 'csv'
require './lib/dish.rb'
require './lib/menu.rb'
require './lib/order.rb'
require './lib/text.rb'

class Takeaway
  def initialize(menu_class = Menu,
      order_class = Order,
      default_menu_path = "./lib/default_menu.csv"
      )

    @menu = menu_class.new
    @order_class = order_class
    load_menu(default_menu_path)
    @orders_list = {}
  end

  def see_menu
    menu_string
  end

  def choose
    @menu.see.each do |item|
      quantity = gets.chomp
      @orders_list[item] = quantity.to_i
    end
    @orders_list
  end

  def exact_total
    @exact_total = gets.chomp.to_i
  end

  def create_order
    @order = @order_class.new(@order_list, @exact_total)
  end

  def place_order
    @order.send_text
  end

  private

  def load_menu(file_path)
    CSV.foreach(file_path, :headers => true) do |item|
      @menu.add_dish(item['Name'], item['Price'])
    end
  end

  def menu_string
    @menu.see.map.each_with_index do |item, index|
      "#{index + 1}. #{item.name}; £#{item.price}"
    end
    .join("\n")
  end
end
