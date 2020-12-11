require_relative 'order'
require_relative 'menu'
require_relative 'send_sms'

class Restaurant
  attr_reader :menu, :order, :final_bill, :text_messager

  def initialize(menu, order, text_messager)
    @menu = menu
    @order = order
    @text_messager = text_messager
  end

  def total
    @final_bill = order.total_bill(menu)
    @final_bill
  end

  def finalise(amount = 0)
    fail "Error: sum of dishes in order does not match total bill!" if !correct_amount?(amount)
    send_text
  end

  private

  def correct_amount?(amount)
    amount == @final_bill.gsub(/[^0-9]/,'').to_i
  end

  def send_text
    text_messager.send
  end

end
