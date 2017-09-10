class Menu

  attr_reader :dishes

  def initialize
    @dishes = { "pizza" => 3.00, "coke" => 1.00 }
  end

  def to_s
    dishes.each do |dish, price|
      p "#{dish}: $#{'%.2f' % price}"
    end
  end

  def price(dish)
    dishes[dish]
  end
end
