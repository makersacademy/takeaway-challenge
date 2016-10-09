class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print_dishes
    dishes.map{ |item, price| item.to_s.capitalize + " £#{price}"}.join(", ")
  end

end
