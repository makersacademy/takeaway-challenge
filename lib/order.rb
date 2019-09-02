require 'twilio-ruby'
require_relative 'twilio'

DEFAULT_MENU = {
  pizza: 9,
  pancakes: 4,
  pasta: 7,
  paella: 8,
  popcorn: 3,
  curry: 6,
  chicken_fajitas: 10
}
class Order
  attr_reader :selection
  attr_reader :menu
  include Twilio
  def initialize(menu = DEFAULT_MENU)
    @menu = menu
    @selection = []
    # @total = []
  end

  def checkout
    body = "your order will arrive at #{(Time.now + 3600).strftime("%X")}"
    send_text(body)
  end

  def select(item, quant)
    @selection << { meal: item, quantity: quant, total: (@menu[item.to_sym] * quant) }
    "your order will cost £#{total()}"
  end

  def total
    total = 0
    @selection.each { |hash| total += hash[:total] }
    return total
  end

end
