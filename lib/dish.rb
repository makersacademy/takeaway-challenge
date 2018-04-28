class Dish

  attr_reader :name, :description, :price

  def initialize(args = {})
    @name = args[:item]
    @description = args[:description]
    @price = args[:price]
  end

end
