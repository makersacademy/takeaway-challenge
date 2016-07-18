require './lib/menu'
require './lib/sms'

class Takeaway

  attr_reader :order, :basket, :subtotals

  def initialize(menu: Menu.new, sms: nil)
    @menu = menu
    @sms = sms || SMS.new
    @order = {}
    @basket = []
    @subtotals = []
  end

  def print_menu
    menu.print_list
  end

  def add_item(item: , quantity: )
    order.store(item,quantity)
  end



  def place_order

    sms.delivery_message
  end

  private

  attr_reader :menu

  

end
