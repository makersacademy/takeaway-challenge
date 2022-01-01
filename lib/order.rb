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

  def total
    total = 0
    order_list.each do |item|
      item.each do |dish, quantity| 
        total += dish.price * quantity
      end
    end
    total
  end

  def summary
    output = []
    @order_list.each do |item|
      item.each do |dish, quantity|
        output << "#{dish.name}: #{dish.price} x #{quantity} = #{dish.price * quantity}"
      end
    end
    output.join(", ")
  end
end
