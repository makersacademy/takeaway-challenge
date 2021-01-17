

class Menu
  attr_accessor :dishes
  def initialize
    @dishes = { "onion bhaji" => 2.95, "vegetable samosa" => 2.95, "aloo pakora" => 2.95,
                "chicken tikka" => 3.95, "mixed kebab" => 4.95 }
  end

  def add_item(item, price)
    @dishes[item] = price
    "#{item}, #{price}"
  end
end
