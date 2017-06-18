require_relative 'menu.rb'
require_relative 'order.rb'
require_relative 'sms_service.rb'

class Restaurant
  attr_reader :name, :menu, :food_items, :phone_number, :total

  def initialize(name, menu = Menu.new)
    @name = name
    @menu = menu
  end

  def give_menu
    @menu.read_menu(menu.menu_name)
  end

  def record_order(client, order = Order.new)
    @phone_number = client.phone_number
    @food_items = order.ask_order
    @total = order.total
  end

  def confirm_order(client)
    client.check_order
  end

  def send_sms(sms = Sms.new, client)
    sms.send_sms if confirm_order(client)
  end

end
