class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def display
    @dishes.map { |name, price| "%s £%.2f" % [name, price] }.join(", ")
  end
end