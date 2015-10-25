require_relative 'menu'
require 'twilio-ruby'

class Takeaway

  ACCOUNTS_SID = 'AC0d5ab4e4089ccba3ffa0d6e307f3220d'
  AUTH_TOKEN = 'e513890d85d278d4cf1513a63d89dcaa'

  attr_reader :menu, :total

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

  def confirm_total(total)
    total == @menu.total
  end

  def checkout(total)
    send_message if confirm_total(total)
  end

  def send_message
    @twilio.messages.create(
      from: '+441274451315',
      to: '+447805214741',
      body: "Your order has been accepted!  #{view_current_order} will arrive by #{(Time.now+3600).strftime('%H:%M')}")
  end
end