class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name.tr(" ","_").to_sym
    @price = price*1.0
  end

end
