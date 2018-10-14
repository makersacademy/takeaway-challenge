# This class holds types of dishes found at the resturaunt

class Dish

  DEFAULT_TOTAL = 0 # Zero for functionality with other classes

  attr_reader :name, :price, :quantity

  def initialize(name, price)
    @name = name
    @price = price
    @quantity = DEFAULT_TOTAL
  end

  # Function called by order when customer
  # selects more then one instance of the dish
  def up_quantity
    @quantity += 1
  end
end
