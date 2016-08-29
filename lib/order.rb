require_relative 'menu'

class Order
  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def select_dish(dish)
    basket << dish
  end

  private

  attr_reader :menu
end
