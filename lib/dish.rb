class Dish

  attr_reader :dish, :name, :price

  def initialize( dish = {:name => "dish_name", :price => 1 } )
    @dish = dish
    @name = dish[:name]
    @price = dish[:price]
  end

end
