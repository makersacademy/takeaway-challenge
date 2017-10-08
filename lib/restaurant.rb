require_relative 'messenger'
class Restaurant
  attr_reader :orders, :menu

  def initialize(menu = Menu.new)
    @orders = []
    @menu = menu
  end

  def see_menu
    @menu.change_menu_to_string
  end

  def submit_order(new_order)
    @orders << new_order
    Messenger.send(get_order_confirmation_message)
  end

  def get_order_confirmation_message
    t = Time.new
    t += 60 * 60
    "Thank you! Your order was placed and will be delivered before " + t.strftime("%R")
  end


  def add_money_paid_for_items

  end






end
