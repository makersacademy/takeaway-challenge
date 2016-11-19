require './lib/takeaway'
require './lib/menu'

class Order

  attr_reader :basket, :total

def initialize
  @menu_klass = Menu.new
  @basket = []
  @total = 0
end

def make_order(hash)
  hash.each do |order,amount|
    amount.times do
  (@menu_klass.menu.each do |food,price|
    if food == order
      @basket << {food => price}
    end
  end)
  end
  end
  @basket
end

def complete_order
  @basket.each do |instance|
  instance.each do |food,price|
  @total += price
  end
  end
end



end
