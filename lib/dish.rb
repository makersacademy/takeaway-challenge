class Dish
  attr_reader :name, :description, :price, :item_id

  def initialize(name, description, price, id)
    @name = name
    @description = description
    @price = price
    @item_id = id
  end

end
