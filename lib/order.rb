require 'sms'

class Order
  attr_reader :dishes
  
  def initialize(sms = SMS.new)
    @dishes = []
    @sms = sms
  end

  def place_order
    sms.send(
      "Thank you! " +
      "Your order was placed and will be delivered before " +
      "#{one_hours_time}"
    )
    @dishes = []
  end

  def select_dish(dish, quantity)
    dishes << { dish: dish, quantity: quantity }
    dishes.last
  end

  def total
    return 0 if dishes.empty?
    dishes.map { |item| line_item_total(item) }.reduce(:+)
  end

  private

  attr_reader :sms
  attr_writer :dishes

  def line_item_total(line_item)
    line_item[:dish].price * line_item[:quantity]
  end

  def one_hours_time
    now = Time.new
    "%02d" % (now.hour + 1) + ":" + "%02d" % now.min
  end
end
