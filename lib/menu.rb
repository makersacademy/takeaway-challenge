class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print
    dishes.map do |item, cost|
      "%s $%.2f" % [item.to_s, cost]
    end.join(", ")
  end

  def has_dish?(plate)
    !dishes[plate].nil?
  end

  def price(dish)
    dishes[dish]
  end

end
