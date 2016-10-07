require_relative 'menu'

class Order

  attr_reader :menu, :put_in_basket

  def initialize
    @put_in_basket = []
    @menu = Menu.new
  end

  def select_item(food)
    @put_in_basket << food
  end

end
