require_relative 'sms'

class Bill

  def initialize(order, menu)
    @price_of_orders = []
    @get_orders = order
    @menu_items = menu
  end

  def bill
    @get_orders.each do |dish, how_many|
      @price_of_orders << @menu_items[dish] * how_many
    end
    @total_bill = @price_of_orders.sum
  end

  def conf_message(amount, conf = Sms.new)
    raise "please settle the bill" unless @total_bill <= amount
    conf.send_message
  end

end
