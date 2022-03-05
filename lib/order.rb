require_relative 'menu'

class Order
  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def select_dish(item, quantity = 1)
    quantity.times { @basket << [item, @menu.dishes[item]] }
  end

  def calculate_total
    @basket.map { |item| item[1] }.reduce(:+)
  end
end
