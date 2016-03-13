require_relative 'menu'
require_relative 'sms_message'
require 'dotenv'
Dotenv.load


class Takeaway

  def initialize
    @menu = Menu.new
  end

  def menu
    @menu.menu.dup
  end

  def select_items(order)
    order.map{|key,val| val * menu[key] if menu.key? key}.reduce(:+)
  end

  def place_order(order,total)
    raise "Amount given is not correct" unless total == select_items(order)
    confirm(order)
  end

private

  def confirm(order)
    SMSMessage.new.send(order)
  end


end
