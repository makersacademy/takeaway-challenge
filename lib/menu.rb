class Menu

  attr_reader :dishes

  def initialize(dishes = {"rice"=>1.00, "chicken"=>4.00, "beef"=>4.0, "duck"=>6.0, "prawn"=>6.00})
    @dishes = dishes
  end

  def print
    dishes.map { |k, v| "%s £%.2f" % [k.to_s, v] }.join(", ")
  end

  def has_dish?(dish)
    !!dishes[dish]
  end

  def price(dish)
    dishes[dish]
  end

end