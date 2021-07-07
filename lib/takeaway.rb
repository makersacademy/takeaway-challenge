require 'dotenv/load'
require 'twilio-ruby'
require_relative 'menu'
require_relative 'SMS'

class Takeaway
  attr_reader :order

  def initialize(menu = Menu.new, sms_class = SMS)
    @menu = menu
    @order = {}
    @sms_class = sms_class
  end

  def see_menu
    display = ""
    @menu.list.each do |dish, price|
      display << "#{dish}: £#{price},"
    end
    puts display.split(",")
  end

  def place_order(item, quantity)
    validate_order(item, quantity)
    @order.store item, quantity
  end

  def check_total(order = @order)
    sum = 0
    order.each do |item, quantity|
      sum += quantity * @menu.list[item.to_sym]
    end
    sum
  end

  def complete_order(order, total)
    raise "Incorrect total" if check_total(order) != total
    
    @sms = @sms_class.new
  end

  private

  def validate_order(item, quantity)
    raise "Please order whole dishes only, thanks" unless quantity.is_a? Integer
    raise "Sorry we don't do that here" unless @menu.list.include?(item.to_sym) 
    raise "Are you having a laugh?!" if quantity.to_i < 1
  end

end
