require './lib/order'
require './lib/sms'
require './lib/menu'

class Takeaway
  attr_reader :menu, :order, :sms
  
  def initialize(menu = Menu.new, config = {}, order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new(config)
  end
  
  def print_menu
    @menu.show_menu
  end

end
