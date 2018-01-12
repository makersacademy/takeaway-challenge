class Order
  attr_reader :dishes
  def initialize(order, menu)
    @dishes = order
    @menu = menu
  end

  def add dish, number
    dishes[dish] = 0 if dishes[dish] == nil
    dishes[dish] += number
  end

  def check
    dishes.each{|dish, number| raise "Error, dish not on menu: #{dish}" if menu.dishes[dish] == nil }
  end

  def price
    price = 0
    dishes.each{|dish, number| price += (menu.dishes[dish].price * number)}
    price
  end

  private
  attr_reader :menu
end
