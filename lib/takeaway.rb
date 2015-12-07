require_relative 'menu'
require_relative 'message'

class Takeaway
attr_reader :menu, :order

  def initialize(menu_klass = Menu.new, message_klass = Message)
    @message = message_klass
    @menu = menu_klass
    @order = []
    @bill = 0
  end

  def add_to_order(dish, quantity)
    @order << [ dish, quantity ]
  end

  def bill_calc
    @order.each { |ordered_dish| my_bill_calc(ordered_dish)  }
    @bill
  end

  def place_order(expected_bill)
    bill_calc
    fail 'bill and expected bill are different' if @bill != expected_bill
    send_sms
  end

  private

  def send_sms
    @message.new.send_sms
  end

  def my_bill_calc(ordered_dish)
    @bill += ordered_dish[1] * menu.list[ordered_dish[0].to_sym]
  end

end
