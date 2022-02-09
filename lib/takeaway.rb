class Takeaway
  attr_reader :basket

  def initialize 
    @menu = {"pasta": 7, "dhal": 9 , "pizza": 10 , "chocolate": 9} 
    @basket = { }
    @total_cost = 0
    @basket_with_cost = {}
  end

  def view_menu
    @menu
  end

  def order (dish, quantity)
    price_lookup(dish, quantity)
    already_ordered_flag= @basket.keys.include? "#{dish}"
    already_ordered_flag ? updating_order_quanity(dish, quantity) : @basket["#{dish}"] = quantity
    return "Orderd #{dish} x #{quantity}"
  end

  def total 
    @total_cost
  end

  def basket_summary
    # "spring roll x4 = £3.96, pork dumpling x3 = £8.97"
    @basket_with_cost
  end

  private

  def updating_order_quanity (dish, new_quantity) 
    original_quanity = @basket["#{dish}"]
    new_total = original_quanity + new_quantity
    @basket["#{dish}"] = new_total
  end 

  def price_lookup(dish, quantity)
    price = @menu[dish.to_sym]
    @total_cost =  @total_cost + (price * quantity)
    # would need a conditional to make sure that we aren't updating the other price
    @basket_with_cost["#{dish} x #{quantity}"] = price * quantity
  end

end
 