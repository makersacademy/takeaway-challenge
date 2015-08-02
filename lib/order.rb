class Order
  
  attr_reader :selection
  attr_reader :menu

  def initialize menu
    @selection = {}
    @menu = menu
  end

  def add_item dish, quantity
    return "That item is not on the menu" if !on_menu? dish
    selection.store dish, quantity
  end

  def on_menu? dish
    menu.dishes.include? dish
  end

  def place_order amount
    return "Thankyou! Order was successfully placed." if correct_amount? amount
    return "Order unsuccessful. Total should equal #{build_order[selection]}" if !correct_amount? amount
  end

  def correct_amount? amount
    amount == build_order[selection]
  end

  def build_order
    total = 0 
    selection.each do |item, quantity| 
      total += quantity * menu.dishes[item]
    end
    {selection => total}
  end

end