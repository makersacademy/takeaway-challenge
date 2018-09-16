require_relative 'sms'

class Order
  attr_reader :basket
  
  def initialize(sms = SMS.new)
    @basket = []
    @sms = sms
  end

  def place_order
    sms.send(
      "Thank you! " +
      "Your order was placed and will be delivered before " +
      "#{one_hours_time}"
    )
    @basket = []
  end

  def add_dish(dish, quantity)
    basket << { dish: dish, quantity: quantity }
    basket.last
  end

  def total
    return 0 if basket.empty?
    basket.map { |item| line_item_total(item) }.reduce(:+)
  end

  private

  attr_reader :sms

  def line_item_total(line_item)
    line_item[:dish].price * line_item[:quantity]
  end

  def one_hours_time
    now = Time.new
    "%02d" % (now.hour + 1) + ":" + "%02d" % now.min
  end
end
