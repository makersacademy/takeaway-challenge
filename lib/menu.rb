require 'CSV'

class Menu
  MENU_WIDTH = 40

  attr_reader :items

  def initialize(filename = "menu.csv")
    @items = []
    load_menu(filename)
  end

  def display
    print_header
    print_menu
  end

  private

  def load_menu(filename)
    CSV.foreach(filename) do |line|
      item, price = line
      add_to_items(item, price)
    end
  end

  def add_to_items(item, price)
    @items << { item: item, price: price }
  end

  def print_header
    puts "Menu".center(MENU_WIDTH)
    puts "------".center(MENU_WIDTH)
  end

  def print_menu
    @items.each do |item|
      puts "#{item[:item].capitalize} £#{item[:price]}".center(MENU_WIDTH)
    end
  end
end
