require_relative 'menu'

class Order
  attr_reader :menu, :basket, :total

  def initialize
    @basket = []
    @total = 0
  end

  def add_item(item, amount = 1)
    @basket << [item, amount]
    if item == 'sushi'
      @total += (amount * 5)
    end
    if item == 'noodles'
      @total += (amount * 7)
    end
    if item == 'edamame'
      @total += (amount * 3)
    end
  end
end
