require_relative 'menu'
require_relative 'twilio_sender'

class Takeaway

  attr_reader :current_order

  def initialize(menu = Menu, twilio = TwilioSender)
    @menu = menu.new
    @twilio = twilio.new
    @current_order = []
  end

  def add_to_order(dish)
    @current_order << dish_finder(dish)
  end

  def place_order(given_total)
    fail "Total incorrect!" unless @menu.check_total(@current_order, given_total)

    reset_current_order
    @twilio.twilio_message
  end

  def add_dish(name, price)
    @menu.add_dish(name, price)
  end

  def print_menu
    @menu.print_menu
  end

  private

  def reset_current_order
    @current_order = []
  end

  def dish_finder(dish)
    @menu.dishes.find { |x| x.details[:name] == dish }
  end

end
