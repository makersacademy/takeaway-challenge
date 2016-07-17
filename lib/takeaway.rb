require './lib/menu'
require './lib/sms'

class Takeaway

  attr_reader :order

  def initialize(menu: Menu.new, sms: nil)
    @menu = menu
    @sms = sms || SMS.new
    @order = {}
  end

  def print_menu
    menu.print_list
  end

  def add_item(item: , quantity: )
    order.store(item,quantity)
  end

  def view_order
    print_basket
  end

  def place_order

    sms.delivery_message
  end

  private

  attr_reader :menu

  def print_basket
    order.each do |item,quantity|
    basket << "#{item} x #{quantity} = £#{"%.2f" % (subtotal(item,quantity))}"
    @basket_details = basket.join(" ")
    end
  end

end
