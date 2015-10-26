require_relative 'menu'
require_relative 'sendsms'

class TakeAway

  attr_reader :menu, :order

  def initialize menu_klass, sms_klass
    @menu = menu_klass.new
    @order = Hash.new(0)
    @sms_klass = sms_klass
    # @basket = Array.new
  end

  def menu_list
    @menu.show_menu
  end

  def add_item item, quantity = 1
    fail 'not in the menu' unless menu.dishes.include?(item)
    order[item] += quantity
    "#{quantity} #{item} has been added to your order"
  end

  def delete item, quantity = 1
    fail 'dish not in the menu' unless menu.dishes.include?(item)
    order[item] -= quantity
  end

  def order_summary
    summary = order.map{|i,q|"#{i} x #{q} = £#{(menu.dishes[i]*q)}"}.join(', ')
    "Your order: " +summary
  end

  def confirmation(replay = nil)
    puts 'it\'s ok?'
    replay = gets.chomp.downcase if replay.nil?
    confirmed if replay == 'yes'
  end

  def total
    "Your bill is: £#{total_bill}"
  end

  private
  def confirmed
    send_sms
    'thank you for your order, You will receive a confirmation message soon'
  end

  def send_sms
    @sms_klass.new(order_summary, total)
  end

  def total_bill
    order.map { |item,quantity| menu.dishes[item]*quantity }.reduce(:+)
  end

end
