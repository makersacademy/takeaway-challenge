require_relative 'menu'

class Takeaway
attr_reader :dishes, :basket, :total_cost

  def initialize(dishes = Menu.new.dishes)
    @dishes = dishes
    @basket = {}
    @total_cost = 0
  end

  def read_menu
    @dishes
  end

  def order(food, amount = 1)
    if @dishes.has_key?(food.to_sym)
      @basket[food] = amount
    else
      "Item not on menu, please try again"
    end
  end

  # def add
  # end

  def basket_summary
    @basket
  end

  def basket_price
    @basket.each do |food, amount|
      @total_cost += (read_menu[food.to_sym] * amount)
    end
    @total_cost.round(2)
  end


end