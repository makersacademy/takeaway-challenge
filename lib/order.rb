require 'twilio-ruby'
require 'send_message'

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
  include Twilio
# needs to be able to select meals
# needs to be able to check total is consistent with actual total
# needs to be able to confirm selection
  def initialize(menu = DEFAULT_MENU)
    @menu = menu
    @selection = []
    # @total = []
  end

  def menu
    @menu
  end

  # def checkout
  #   CLIENT.messages.create(
  #   from: FROM,
  #   to: TO,
  #   body: "your order will arrive at #{(Time.now + 3600).strftime("%X")}"
  #   )
  # end

  def select(item, quant)
    @selection << {meal: item, quantity: quant, total: (@menu[item.to_sym] * quant)}
    "your order will cost £#{total()}"
  end

  def total
    total = 0
    @selection.each { |hash| total += hash[:total] }
    return total
  end

end
