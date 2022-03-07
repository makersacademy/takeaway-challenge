require_relative 'menu'
require_relative 'send_sms'
require 'twilio-ruby'

class Order
  NOT_ON_MENU_ERROR = 'This is not on the menu'.freeze
  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end

  def select_dish(item, quantity = 1)
    fail NOT_ON_MENU_ERROR unless available?(item)
    quantity.times { @basket[item] += @menu.dishes[item] }
  end

  def remove_dish(item, quantity = 1)
    fail NOT_ON_MENU_ERROR unless available?(item)
    quantity.times { @basket[item] -= @menu.dishes[item] }
  end

  def checkout(sms = SMS.new)
    @sms = sms
    bill
    puts '*************'
    puts "Your total is #{calculate_total}"
    @sms.send_sms
  end

  private

  def bill
    @basket.each { |dish, price| puts "#{dish}: #{price}" }
  end

  def calculate_total
    @basket.values.reduce(:+)
  end

  def available?(item)
    @menu.dishes.has_key?(item)
  end
end
