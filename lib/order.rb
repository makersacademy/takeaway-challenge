require_relative 'menu'

class Order
  attr_reader :overview, :menu

  def initialize(menu)
    @menu = menu
    @overview = []
  end

  def show_menu
    menu
  end

  def select_dish(quantity,dish)
    overview << [quantity, dish, menu.dishes[dish]]
  end

  def show_sum
    calculate_price
  end

  private
  
  def calculate_price
    overview.inject(0){|sum,dish| sum + dish[2]}
  end
end
