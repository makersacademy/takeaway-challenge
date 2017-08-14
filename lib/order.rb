require './lib/menu.rb'
class Order

  attr_reader :basket, :menu, :total_cost

  def initialize(_menu)
    @menu = Menu.new
    @basket = []
    @total_cost = []
  end

  def place_order(dish, amount)
    unless menu.dish.has_key?(dish.to_sym)
      raise 'sorry this dish is not avaiable'
    end
    @basket << [dish, amount]
  end

  def total
    @basket.map do |dish, amount|
      @total_cost << menu.dish[dish.to_sym] * amount
    end
  end

end
