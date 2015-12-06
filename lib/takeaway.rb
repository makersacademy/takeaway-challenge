require_relative 'menu'

class Takeaway
attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = []
    @bill = 0
  end

  def add_to_order(dish, quantity)
    @order << [ dish, quantity ]
  end

  def bill_calc
    @order.each { |x| @bill += x[1] * menu.list[x[0].to_sym] }
    @bill
  end

  def place_order(expected_bill)
    bill_calc
    fail 'bill and expected bill are different' if @bill != expected_bill
    'order successfully placed'
    # send_sms
  end
end
