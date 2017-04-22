require_relative 'menu'

class Takeaway

  attr_reader :menu, :basket

  def initialize
    @menu = Menu.new
    @basket = []
  end

  def read_menu
    menu.list_dishes
  end

  def order(item, quantity=1)
    fail 'Item not available' if !menu.dishes.has_key?(item)
    quantity.times {basket << item }
  end

  def verify_order(total)
    basket.map { |item| menu.dishes[item] }.reduce(:+)
  end

end
