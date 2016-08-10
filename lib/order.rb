require_relative 'menu'
require_relative 'Sms'

class Order

  attr_reader :menu, :customer_order, :sms

  def initialize(menu = Menu.new, sms = Sms)
    @menu = menu
    @customer_order = {}
    @sms = sms
  end

  def add(item, quantity)
    raise 'Dish not available' unless @menu.has_dish?(item)
    @customer_order[item] = quantity
  end

  def total
    customer_order.map do |item, quantity|
      return menu.price(item) * quantity
    end
  end

  def see_menu
    menu.print
  end

  def checkout
    sms.new.send_text
  end

  private

  def has_dish?
    !menu[item].nil?
  end
end
