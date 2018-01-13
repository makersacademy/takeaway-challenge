require_relative 'menu'

class Order

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_to_order(item)
    @basket << details(item)
  end

  private

  def details(item)
    Menu::MENU.select {|k,v| k == item.to_sym }
  end

end

# item = gets.chomp.to_sym
