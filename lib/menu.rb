module Menu

  attr_reader :items, :food, :price

  def initialize
    @menu_items ={"Duck Rice" => 8, "Tonkotsu Ramen" => 8, "Gyoza" => 5, "Jalapeno Hamachi" => 8, "Summer Rolls" => 5, "Mango" => 3}
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