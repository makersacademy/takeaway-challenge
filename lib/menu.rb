class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print
    dishes.map{|dish, price| "%s £%.2f" % [dish.to_s, price]}.join(", ")    # %[flags][width][.precision]type
  end


end
