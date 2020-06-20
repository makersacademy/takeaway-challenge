require 'menu'

class Order
  attr_reader :basket

  def initialize
    @basket= []
    @menu = Menu.new
  end

  def add(dish)
    @basket << @menu.dishes[dish]
  en

  def remove
  end

  def show_price
  end

end