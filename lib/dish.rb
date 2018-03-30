class Dish
  
  attr_reader :price, :id

  def Dish.id_generator
    if  defined?(@@id).nil?
      @@id = 1
    else
      @@id += 1
    end
  end

  def initialize(name, price)
    @name = name
    @price = price
    @id = Dish.id_generator
  end


end
