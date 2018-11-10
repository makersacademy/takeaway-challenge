
class Order

  attr_reader :list_of_dishes

  def initialize
    @list_of_dishes = [{ "Roasted stuffed cauliflower" => 13},
                       { "Stuffed pumpkin" => 12},
                       { "Vegan chilli" => 15},
                       { "Vegan brownies" => 8}]
  end

  def dish
    @list_of_dishes
  end

end
