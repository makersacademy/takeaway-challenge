require_relative 'total'
require_relative 'menu'

class Order

  attr_accessor :basket, :total

  def initialize
    @menu = Menu.new
    @basket = []
    @total = 0
  end

  def order(item, quantity = 1)
    quantity.times do
      @basket << item
      @total += @menu.menu[item[key]]
    end
  end

end
