
class Takeaway
  attr_reader :menu
  attr_reader :current_order

  def initialize(ordertime_class = OrderTime)
    @menu = {bread: 5, apples: 2}
    @current_order = new_order
    @ordertime_class = ordertime_class
  end

  def select(item)
    @current_order[item.to_sym] += 1
  end

  def complete_order(value)
    if value == order_price
      "Thank you, your order was placed and will be delivered before #{confirm_time}"
    else
      raise "Cannot complete order: Incorrect Value"
    end
  end

  def print_current_order
    order = ''
    @current_order.each{|item, quantity| order = order + "#{item}: #{quantity} " if quantity > 0}
    order = order.chop
    order
  end

  private

  def new_order
    Hash[@menu.map{|item , quantity| [item, 0]}]
  end

  def order_price
    total = 0
    @current_order.each do |item, quantity| 
      quantity.times do
        total += @menu[item]
      end
    end
    total
  end

  def confirm_time
    confirm_time = @ordertime_class.new
    confirm_time.delivery_time
  end
end
