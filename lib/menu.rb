require 'csv'
# Manages list of dishes (with their prices)
class Menu
  attr_accessor :list

  def initialize
    @list = []
  end

  def load_menu(filename = "sample_menu.csv")
    CSV.foreach(filename) do |item_code, item_name, item_price|
      add_to_menu(item_code, item_name, item_price)
    end
  end

  def add_to_menu(item_code, item_name, item_price)
    @list << { item_code: item_code, item_name: item_name, item_price: item_price.to_i }
  end

  def display_menu
    @list.each do |display|
      puts "#{display[:item_code]}.#{display[:item_name]} - £#{display[:item_price]}"
    end
  end

end
