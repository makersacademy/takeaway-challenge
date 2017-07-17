require_relative 'sms_messanger'

class Order
  attr_reader :order
  def initialize(menu)
    @menu = menu
    @order = {}
    @total = 0
    @sms = SMSMessenger.new
  end

  def add_item_to_order(item, quantity)
    @order[item.to_sym] = [@menu[item.to_sym], quantity]
    @order
  end

  def check_order
    puts '---Your Shopping List---'
    @order.each do |key, value|
      puts key.to_s.ljust(10) + value[1].to_s + " €" + value[0].to_s
      @total += value[1] * value[0]
    end
     puts "--- Total = €#{@total} ---"
  end

  def place_order(total)
    return @sms.send_sms if total == @total
    raise "Sorry we don't hangel" if total < @total
    raise "To much try again" if total > @total
  end
end
