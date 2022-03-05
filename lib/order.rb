require 'time'
class Order
  
  attr_reader :list

  def initialize(menu)
    @menu = menu
    @list = []
  end
  
  def select(dish, quantity)
    quantity.times { @list << @menu.list[dish] }
  end

  def total
    @list.flatten.select{|i|i.is_a? Float}.sum
  end

  def confirm
    delivery_time = (Time.now + (60*60)).strftime("%k:%M")
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end

end