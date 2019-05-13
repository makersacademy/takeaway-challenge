class Menu
  
  attr_reader :dishes
  
  def initialize(dishes)
    @dishes = dishes
  end

  def print
    dishes.map do |title, price|
      "%s £%.2f" % [title, price]
    end.join(", ")
  end
end