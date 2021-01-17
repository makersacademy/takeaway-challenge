class Menu
  attr_reader :dishes
  def initialize(dishes)
    @dishes = dishes
  end

  def display
    dishes.map do |key, value|
      "#{key}: £%.2f" % [value]
    end.join(", \n")
  end

end
