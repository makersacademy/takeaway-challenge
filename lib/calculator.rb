class Calculator

  def initialize(item_name)
    @item_name = item_name
    @price_list = {
      "fish" => 8,
      "pizza" => 5,
      "pasta" => 6,
      "cake" => 3
    }
  end

  def calculate_price
    @price_list[@item_name]
  end

end
