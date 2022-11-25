require_relative './format_price.rb'

class Menu
  attr_reader :menu
  include FormatPrice

  def initialize(terminal = Kernel, menu = [
    { name: 'burger', price: 4.50, quantity: 10 },
    { name: 'hot dog', price: 3.00, quantity: 10 },
    { name: 'CocaCola', price: 1.00, quantity: 5 },
    { name: 'chips', price: 2.00, quantity: 1 }
  ])
    @menu = menu # funky looking initialize so i could test a fake menu, but also so you could initialize with different menus i suppose
    @terminal = terminal
  end

  def list_available
    @terminal.puts 'Items in stock:'
    item_num = 1
    available_items.each do |item|
      name = item[:name]
      price = item[:price]
      @terminal.puts "#{item_num}. #{name} - #{format_price(price)}"
      item_num += 1
    end
  end

  def includes_item(item)
    @menu.each do |menu_item|
      return true if menu_item[:name] == item
    end
    false
  end

  def item_out_of_stock(item)
    @menu.each do |menu_item|
      return true if menu_item[:quantity] < 1 and menu_item[:name] == item
    end
    false
  end

  def price_of_item(item)
    @menu.each do |menu_item|
      return menu_item[:price] if menu_item[:name] == item
    end
  end

  def stock_of_item_decreases(item, number)
    @menu.each do |menu_item|
      if menu_item[:name] == item
        raise 'Not enough stock to fulfil order, please choose a lower amount' if number > menu_item[:quantity]

        menu_item[:quantity] -= number
      end 
    end   
  end
 
  private

  def available_items
    @menu.select { |item| item[:quantity] > 0 }
  end
end
