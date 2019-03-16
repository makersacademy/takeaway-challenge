require_relative 'menu_list'

class Customer

  attr_reader :name, :contents

  def initialize(name)
    @name = name
    @contents = []
  end

  def add(dish, quantity)
    raise "Item not on menu" if  !List::LIST.include?(dish)
    @name = dish
    @price = List::LIST[dish]
    @quantity = quantity
    @contents << { name: @name, price: @price, quantity: quantity }
  end

  def basket
  end

end
