class Order
  attr_reader :order_list

  def initialize
    @order_list = []
  end
  
  def add(dish, quantity = 1)
    item = {}
    item[dish] = quantity
    @order_list << item
  end

  def total()
    total = 0
    order_list.each { |item|
      item.each { |dish, quantity| 
        total += dish.price * quantity
      }
    }
    total
  end
end