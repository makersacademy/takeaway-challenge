module Menu

  def initialize
    @menu_items ={"Club Sandwich" => 5, "Cheeseburger" => 8, "Chips" => 3, "Soft Drink" => 2, "Coffee" => 2}
  end

  def items
    @menu_items
  end

  def food
    items.keys
  end

  def price
    items.values
  end


end







