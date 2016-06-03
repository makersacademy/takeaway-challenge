
class Dish
  
  attr_reader :name, :price
  
  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "#{ name }:\t#{ price }"
  end
end


