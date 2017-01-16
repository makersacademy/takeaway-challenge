class Menu
  attr_reader :dishes

  def initialize
    @dishes = {"Fish and Chips"=>7.99, "Shephards Pie" => 5.99, "Burger" => 6.99}
  end

  def print
    dishes.map do |dish, price|
      p "#{dish}; £#{price}"
    end
  end

  def price(dish)
    dishes[dish]
  end

end
