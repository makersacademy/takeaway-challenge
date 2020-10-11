require 'menu'

class Order
  attr_reader :basket

  def initialize(menu = Menu.new, printer = Printer.new)
    @basket = Hash.new(0)
    @menu = menu
    @printer = printer
  end

  def add(item, quantity = 1)
    @printer.place_order

    while true 
      item = gets.chomp
      raise "Item not available at this restaurant" unless item_on_menu?(item)
      break if item == ""

      @printer.input_quantity
      quantity = gets.chomp
      basket[item] += quantity
    end
  end

  def remove(item)
    raise "Item not in basket" unless item_in_basket?(item)
    
    basket.delete(item)
  end
  
  def total
    total = 0
    basket.each { |item, quantity| total += price(item) * quantity }
    total
  end

  private

  def price(item)
    @menu.menu[item]
  end

  def item_on_menu?(item)
    @menu.menu.include?(item) 
  end

  def item_in_basket?(item)
    basket.include?(item)
  end
  
end