require_relative 'menu'
require_relative 'message'

class Order

  attr_reader :basket, :menu, :basket_summary

  def initialize(filename)
    @menu = Menu.new(filename)
    @basket = []
    @basket_summary = []
  end

  def add_item(item, quantity=1)
    raise "We're sorry, that isn't on the menu." if !@menu.dishes.has_key?(item)
    quantity.times do
      @basket << {item => @menu.dishes[item]}
    end
    @basket_summary << "#{quantity} x #{item} = £#{quantity * @menu.dishes[item]}.00,"
    "#{quantity} x #{item} added to your basket"
  end

  def show_basket
    "#{@basket_summary.join(" ")}"
  end

  def confirm_order
    message = Message.new
    message.send_text
    "Thank you for placing your order. A text message will be sent to you shortly confirming your delivery time."
  end

  private


end
