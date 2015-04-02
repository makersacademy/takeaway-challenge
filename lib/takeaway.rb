require 'message'

class Takeaway
  attr_reader :menu, :customer_name, :customer_number

  def initialize menu
    @menu = menu
  end

  def customer name, number
    @customer_name = name
    @customer_number = number
  end

  def show_menu
    menu.view
  end

  def confirm_checkout order
    order.final_bill
  end

  def text_confirmation number, order
    Message.new.send_text number, order
  end
end
