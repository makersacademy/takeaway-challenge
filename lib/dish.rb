class Dish

  attr_reader :name, :price, :dish_info

  def initialize(name:, price:)
    @name = name
    @price = price
    @dish_info = {}
  end

  def set_details
    @dish_info[:name] = @name
    @dish_info[:price] = @price
    @dish_info
  end
end
