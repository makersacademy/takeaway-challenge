class TakeAway
attr_reader :order
  MENU = {
    "Chicken" => 9.99,
    "Pizza" => 7.50,
    "Pasta" => 8.00,
    "Salad" => 7.00
  }

  def initialize 
    @order = []
  end

  def menu
    MENU
  end

  def select(dish, quantity = 1)
    item = MENU.select { |key| key == dish }
    order << item.transform_values { |v| quantity * v.to_f } 
  end

  def basket_summary
    print order
  end

end
