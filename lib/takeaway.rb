require_relative 'menu'
require 'twilio-ruby'

class Takeaway

  ACCOUNTS_SID = ENV['TWILIO_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH']

  attr_reader :menu

  def initialize(menu_klass = Menu.new, twilio_klass = Twilio::REST::Client.new(ACCOUNTS_SID, AUTH_TOKEN))
    @menu = menu_klass
    @twilio = twilio_klass
  end

  def add(food, quantity = 1)
    @menu.add(food, quantity)
  end

  def request_menu
    @menu.view_menu
  end

  def view_current_order
    @menu.view_basket
  end

  def checkout(total)
    raise "Total provided does not match order total!  Please try again" unless confirm_total(total)
    send_message
  end

  private
  def send_message
    @twilio.messages.create(
      from: '+441274451315',
      to: '+447805214741',
      body: "Your order has been accepted!  #{view_current_order} will arrive by #{(Time.now+3600).strftime('%H:%M')}")
  end

  def confirm_total(total)
    total == @menu.total
  end

end