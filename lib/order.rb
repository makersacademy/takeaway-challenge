require_relative 'menu'

class Order

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_to_order(item)
    pair = Menu::MENU.select {|k,v| k == item.to_sym }
    @basket << pair
  end

end

# item = gets.chomp.to_sym
