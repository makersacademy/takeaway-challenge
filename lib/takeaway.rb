require 'order'
require 'send_sms'
require 'menu'
class Takeaway
  def initialize(menu:, config:, order: nil, send_sms: nil)
    @order = order || Order.new(menu)
    @menu = menu || Menu.new
    @send_sms = send_sms || SendSMS.new(config)
  end

  def view_menu
    @menu.print_menu
  end

  def place_order(foods)
    make_order(foods)
    send_sms.deliver
    order.total
  end

  private

  attr_reader :menu, :order, :send_sms

  def make_order(foods)
    foods.each do |dish, quantity|
      order.make_order(dish, quantity)
    end
  end
end
