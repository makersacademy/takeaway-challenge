require './lib/send_sms'

class Order

  attr_reader :menu

  def initialize
    @order = {}
  end

  def add_menu(menu)
    @menu = menu
  end

  def add_dish(dish)
    @order[dish.name] = dish.price
  end

  def contents
    @order
  end

  def total
    total = @order.values.sum
  end

  def place_order
    sms = SMS.new
    sms.send_sms
  end

end
