require_relative 'order.rb'
require_relative 'menu.rb'
require_relative 'confirmation_text.rb'
# require './db/db_connector.rb'

class Takeaway
  def initialize(order = Order.new, menu = Menu.new, sms = ConfirmationText.new)
    @order = order
    @menu = menu
    @sms = sms
  end

  def read_menu
    @menu.display_menu
  end

  def add_to_basket(item, quantity)
    @order.add(item, quantity)
  end

  def remove_from_basket(item)
    @order.remove(item)
  end

  def view_basket
    @order.basket 
  end

  def total_price
    @order.total
  end

  def confirm_order
    #confirmation text
    #link to data base
    $takeaway = 'carbonara'
    load './db/add_takeaway.rb'
  end

  def list_previous_takeaways
    require './db/list_all_takeaways.rb'
  end
  
  def confirmation_text
    @sms.send_message
  end

end