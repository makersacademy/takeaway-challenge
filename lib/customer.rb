require_relative 'menu_list'

class Customer

  attr_reader :name, :contents, :cost

  def initialize(name)
    @name = name
    @contents = []
    @cost = 0
  end

  def add(dish, quantity)
    raise "Item not on menu" unless List::LIST.include?(dish)
    @name = dish
    @price = List::LIST[dish]
    @quantity = quantity
    @cost += @quantity * @price
    @contents << { name: @name, price: @price, quantity: quantity }
  end

  def basket
    @contents
    @cost
  end

end
