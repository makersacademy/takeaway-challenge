require_relative './restaurant.rb'
require_relative './twiliosendsms.rb'

class Order

  attr_reader :menu, :selection, :provided_total

  def initialize(restaurant = Restaurant.new)
    @menu = restaurant.menu
  end

  def select_menu_items(selection, provided_total)
    @provided_total = provided_total
    @selection = selection
  end

  def validate_order
    raise "Incorrect total provided" unless calculated_total == @provided_total
    @provided_total
  end

  def send_sms(messaging_service, phone_number, body)
    messaging_service.send_sms(phone_number, body)
  end

  private

  def calculated_total
    @selection.map { |item, amount| amount * menu[item] }.inject(&:+)
  end

end
