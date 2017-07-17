class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def read
    dishes.map do |item, price|
      "%s £%.2f" % [item.to_s.capitalize, price]
    end.join(", ")
  end

  def has_dish?(dish)
    !!dishes[dish]
  end

  def price(dish)
    dishes[dish]
  end
end
