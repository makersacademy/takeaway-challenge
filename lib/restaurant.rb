require_relative 'menu'
require_relative 'send_sms.rb'

class Restaurant
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def check_menu
    @menu.list_food
  end

  def place_order
    @menu.make_order
  end

  def check_order
    if @menu.correct?
      sms = Sendsms.new
      sms.create_message
    else
      raise("Your order is not correct")
    end
  end
end
