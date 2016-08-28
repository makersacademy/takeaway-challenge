class Order

attr_reader :basket, :current_total, :meals_list

  def initialize(meals_list)
    @meals_list = meals_list
    @basket = Hash.new(0)
    @current_total = 0
  end

  def add_meals(meal,quantity=1)
    basket[meal] += quantity
    order_total(meal,quantity)
     "#{quantity} x #{meal}(s) added to your basket. Total: £#{@current_total}."
  end

  def basket_total
    meal_total = basket.map {|meal,qty| @meals_list[meal] * qty}
    meal_total.inject(:+)
  end

private

  def order_total(meal,quantity)
    total = @meals_list[meal] * quantity
    @current_total += total.round(2)
  end

end
