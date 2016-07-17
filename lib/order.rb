
class Order

  attr_reader :basket, :current_total, :dish_list

  def initialize(dish_list)
    @dish_list = dish_list
    @basket = Hash.new(0)
    @current_total = 0
  end

  def add_to_order(food,quantity=1)
    basket[food] += quantity
    calculate_total(food,quantity)
    "#{quantity}x #{food}(s) added to your basket. Current total: £#{current_total}."
  end
  
  # def current_basket
  #   @basket.map {|dish, qty| "#{dish.capitalize} x #{qty}"} unless @basket.empty?
  #   "Total: £#{current_total}"
  # end

  def total_price_of_basket
    dish_total = basket.map {|food,qty| @dish_list[food] * qty}
    dish_total.inject(:+)
  end

  private

  def calculate_total(food,quantity)
    total = @dish_list[food] * quantity
    @current_total += total.round(2)
  end

end
