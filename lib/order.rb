class Order

attr_reader :basket, :current_total, :meals_list

  def initialize(menu)
    @menu = menu
    @basket = Hash.new(0)
    @current_total = 0
  end

  def add_meals(meal,quantity=1)
    basket[meal.downcase] += quantity
    order_total(meal,quantity)
    total = sprintf('%.2f', @current_total)
     "#{quantity} x #{meal}(s) added to your basket. Total: £#{total}."
  end

  def basket_total
    meal_total = basket.map {|meal,qty| @menu.meals_list[meal] * qty}
    meal_total.inject(:+)
  end

  def basket_empty?
    @basket.empty?
  end

  private

  def order_total(meal,quantity)
    total = @menu.meals_list[meal.downcase] * quantity
    @current_total += total.round(2)
  end

end
