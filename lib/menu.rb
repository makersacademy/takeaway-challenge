
class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = {
		:pie => 5.99,
		:sandwich => 3.29,
		:falafel => 1.00,
		:bagel => 2.56,
	}
  end

  def print
    dishes.map do |title, price|
      "%s £%.2f" % [title.to_s.capitalize, price]
    end.join(", ")
  end

  def has_dish?(dish)
    !dishes[dish].nil?
  end

  def price(dish)
    dishes[dish]
  end

end