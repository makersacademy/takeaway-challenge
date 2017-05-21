
class Dish

  attr_reader :info

  def initialize(name, description, price)
    @name = name
    @description = description
    @price = price
    @info = {name: name, description: description, price: price }
  end

end
