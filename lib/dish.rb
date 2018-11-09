class Dish
  attr_reader :name, :description, :price
  def initialize(dish_hash = {name: "", description: "", price: 0})
    @name = dish_hash[:name]
    @description = dish_hash[:description]
    @price = dish_hash[:price]
  end

  def set_all(dish_hash)
    @name = dish_hash[:name]
    @description = dish_hash[:description]
    @price = dish_hash[:price]
  end

  def name=(dish_hash)
    @name = dish_hash[:name]
  end

  def description=(dish_hash)
    @description = dish_hash[:description]
  end

  def price=(dish_hash)
    @price = dish_hash[:price]
  end
end
