require 'twilio-ruby'
require 'send_sms'

class Restaurant
  include SendSMS

  def initialize(*dishes)
    @menu = dishes
  end

  def show_menu
    formatted_menu = ""
    menu.each_with_index do |item, index|
      formatted_menu += "#{index + 1}. #{item.name} - £#{item.price}\n"
    end
    formatted_menu.chomp
  end

  def receive_order(customers_order)
    customers_total = customers_order[:total]
    fail "wrong total" if customers_total != calculated_total(customers_order)
    send_sms(customers_order)
  end

  private

  attr_reader :menu

  def calculated_total(customers_order)
    calculated_total = 0
    customers_order[:items].each do |dish, quanity|
      calculated_total += menu[dish - 1].price * quanity
    end
    calculated_total.round(2)
  end
end