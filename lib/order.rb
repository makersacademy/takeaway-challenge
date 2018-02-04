require_relative './restaurant.rb'
require_relative './twiliosendsms.rb'

class Order

  attr_reader :menu, :selection, :provided_total

  def initialize(restaurant = Restaurant.new)
    @menu = restaurant.menu
  end

  def select_menu_items(selection, provided_total)
    validate(selection, provided_total)
    @provided_total = provided_total
    @selection = selection
  end

  def send_sms(messaging_service, phone_number)
    messaging_service.send_sms(phone_number, sms_body)
  end

  def sms_body
    "Thank you for your order. "\
    "It will be delivered at #{Time.now.strftime "%H:%M"}"
  end

  private

  def validate(selection, provided_total)
    raise "Incorrect total provided" unless calculated_total(selection) == provided_total
  end

  def calculated_total(selection)
    selection.map { |item, amount| amount * menu[item] }.inject(&:+)
  end

end
