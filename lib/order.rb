require 'twilio-ruby'
require_relative 'twilio'

class Order
  DEFAULT_MENU = {
    curry: 6,
    chips: 2,
    pizza: 6,
    nuggets: 4,
    salad: 3
  }
  attr_reader :menu, :order
  include Twilio

  def initialize(menu = DEFAULT_MENU)
    @menu = menu
    @order = []
  end

  def checkout
    meals = []
    @order.each { |hash| meals << hash[:quantity]
                 meals << hash[:meal]
    }
    body = "Thank you! Your order was placed at #{(Time.now).strftime("%k:%M")} and will be delivered before #{(Time.now + 2700).strftime("%k:%M")}"
    send_text(body)
  end

  def select(item, quantity)
    @order << { meal: item, quantity: quantity, total: (@menu[item.to_sym] * quantity) }
    "Your order will cost £#{total}"
  end

  def total
    total = 0
    @order.each { |hash| total += hash[:total]}
    return total
  end
end
