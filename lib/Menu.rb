class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
    "Cassoulet" => 11,
    "Pan Bagnat" => 9,
    "Pasta arrabiatta" => 10
    }
  end

  def to_s
    @dishes.each { |name, price| "#{name}: £#{price}" } 
  end

  def price(dish_name)
    @dishes[dish_name]
  end 

end
