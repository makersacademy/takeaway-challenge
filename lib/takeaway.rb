require_relative 'menu'
require_relative 'order'
require 'money'
require_relative 'send_sms'

class Takeaway

include Twilio

  attr_reader :completed, :total

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @completed = false
    @order = order
  end

  def get_menu
    menu.print_menu
  end

  def place_order(dish, quantity)
    @order = Order.new if completed?
    @completed = false
    @order.add(dish, quantity)
  end

  def basket_summary
    print_basket_summary(@order.basket)
  end

  def checkout
    @completed = true
    @total = money_format(calc_total)
    send_text
    "Total: #{total}"
  end

  def calc_total
    @order.basket.flatten.select.with_index(1) { |elem, index| (index %3).zero? }.reduce(:+)
  end

  def money_format(amount)
    Money.new(amount, "GBP", I18n.config.available_locales = :en).format(:symbol => true)
  end


  def send_text(total=@total)
    Twilio.send_sms("Thank you for your order: #{total}. Your food will arrive in 10 mins")
  end

private

attr_reader :menu, :order

  def completed?
    @completed
  end

  def print_basket_summary(basket)
    basket.map { |elem| "#{elem[0].to_s.capitalize} x#{elem[1]} = #{money_format(elem[2])}"}.join(", ")
  end

end
