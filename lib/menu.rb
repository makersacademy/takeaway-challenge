class Menu

  attr_reader :items, :dish, :price

  def initialize(dish = "carrot cake", price = 2)
    @items = {}
    @dish = dish
    @price = price
  end

  def display
    # @dish = dish
    # @price = price
    @items = { "dish": dish, "price": price }
  end

  #
  # def items
  #   thing_one = {"dish" => :dish, "price" => :price}
  #   thing_two = {"dish" => :dish, "price" => :price}
  #   thing_three = {"dish" => :dish, "price" => :price}
  # end

end
