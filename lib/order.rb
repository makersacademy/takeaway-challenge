class Order

  attr_reader :takeaway, :order_total, :chosen_dish

  def initialize(takeaway = Takeaway)
    @takeaway = takeaway.new
    @order_total = 0
  end

  def choose(dish_number, number)
    total_price(dish_number, number)
    @chosen_dish = @takeaway.menu[(dish_number - 1)]
    return "You have ordered #{chosen_dish[1]} * #{number} at £#{chosen_dish[2]} each."
  end

  def total_price(dish_number, number)
    item_price = @chosen_dish[2]
    item_price.slice!(0)
    running_total = (item_price.to_f * number)
    @order_total += running_total
  end

end
