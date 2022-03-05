require_relative 'menu'

class Order
  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def select_dish(item, quantity)
    quantity.times { @basket << [item, @menu.dishes[item]] }
  end

  
end
