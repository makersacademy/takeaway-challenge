require_relative 'menu'

class Order
  attr_reader :menu, :basket, :total

  def initialize
    @basket = []
    @total = 0
  end

  def add_item(item, amount = 1)
    menu = Menu.new(item)
    @basket << item
  end

end
