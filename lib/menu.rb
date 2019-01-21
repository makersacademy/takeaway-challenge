require_relative 'dish'

class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes =
    {
      starter: 1.75,
      main: 5.00,
      sides: 2.50,
      sweets: 4.20
    }
  end

  def view
    dishes.map do |name, price|
      "%s £%.2f" % [name.to_s.capitalize, price]
    end.join(", ")
  end

  def has_dish?(dish)
    !dishes[dish].nil?
  end

  def price(dish)
    dishes[dish]
  end
end
