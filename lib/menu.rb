class Menu
  attr_reader :dishes
  def initialize(dishes)
    @dishes = dishes
  end

  def display
    dishes.map { |key, value| "#{key}: £%.2f" % [value] }.join(", \n")
  end

end
