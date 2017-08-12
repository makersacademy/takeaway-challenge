require './lib/menu.rb'
class Order

  attr_reader :basket, :menu

  def initialize(_menu)
    @menu = Menu.new
    @basket = []
  end

  def place_order(dish, amount)
    unless menu.dish.has_key?(dish.to_sym)
      raise 'sorry this dish is not avaiable'
    end
    @basket << [dish, amount]
  end
end
