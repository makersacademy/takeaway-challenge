# Dish
class Dish
  attr_accessor :name, :price, :description

  def initialize name = 'No Name', price = 'No Price', description = 'No Descr.'
    @name, @price, @description = name, price, description
  end
end
