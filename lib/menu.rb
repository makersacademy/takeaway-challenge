class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print
    dishes.map do |name, price| 
      "%s £%.2f" % [name.to_s.capitalize, price]
    end.join(", ")
  end
end