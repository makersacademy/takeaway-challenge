class Order

  attr_reader :takeaway

  def initialize(takeaway = Takeaway)
    @takeaway = takeaway.new
    @order_total = 0
    @food_order = []
  end

  def choose(dish_number, number)
    price_per_item(dish_number, number)
    chosen_dish = @takeaway.menu[(dish_number - 1)]
    @food_order << "#{chosen_dish[1]} * #{number}"
    return "You have ordered #{chosen_dish[1]} * #{number} at £#{chosen_dish[2]} each."
  end

  def order_summary
    "You have ordered " + @food_order[0..-2].join(", ") + " and #{@food_order[-1]}.
    Your total order price is £#{@order_total}0."
  end

  private

  def price_per_item(dish_number, number)
    item_price = @takeaway.menu[(dish_number - 1)][2]
    item_price.slice!(0)
    @order_total += (item_price.to_f * number)
  end

end
