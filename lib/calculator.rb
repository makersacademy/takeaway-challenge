class Calculator

  def initialize
    @price_list = {
      "fish" => 8,
      "pizza" => 5,
      "pasta" => 6,
      "cake" => 3
    }
  end

  def calculate_price(item_name)
    @price_list[item_name.downcase]
  end

end
