require_relative 'menu'
require_relative 'sendsms'

class TakeAway

  attr_reader :menu, :order

  def initialize (menu = Menu.new)
    @menu = menu
    @order = Hash.new(0)
    # @basket = Array.new
  end

  def menu_list
    @menu.show_menu
  end

  def add_meal item, quantity = 1
    fail 'dish not in the menu' if !menu.dishes.include?(item)
    order[item] += quantity
    "#{quantity} #{item} has been added to your order"
  end

  def delete item, quantity = 1
    fail 'dish not in the menu' if !menu.dishes.include?(item)
    order[item] -= quantity
  end

  def order_summary
    summary = order.map { |item,quantity| "#{item} x #{quantity} = £#{(menu.dishes[item]*quantity)}" }.join(', ')
    "Your order: " +summary
  end

  def total
    "Your bill is: £#{total_bill}"
  end

  def send_sms
    SendSMS.new(order_summary, total)
  end

  private
  def total_bill
    order.map { |item,quantity| menu.dishes[item]*quantity }.reduce(:+)
  end

end
