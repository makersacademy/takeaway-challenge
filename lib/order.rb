require_relative 'message'
require_relative 'menu'

class Order

attr_reader :basket, :menu, :sms

  def initialize(menu = Menu.new)
    @menu = menu.items
    @basket = {}
  end

  def view_menu
    @menu.list
  end

  def add_to_order(name, quantity = 1)
    raise 'Item is unavailable' unless @menu.include?(name)
    @basket[name] = quantity
  end

  def order_total
    @basket.map do |name, quantity|
      @menu[name] * quantity
    end
  end

  def sum_order
    order_total.sum
  end

  def check_total
    if order_total == sum_order
      send_text
    end
  end

  private
  def send_text
    @sms = Message.new
  end

end
