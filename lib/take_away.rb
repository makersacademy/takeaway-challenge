require_relative 'twilio'
require_relative 'order'
require_relative 'menu'

class TakeAway

  attr_reader :menu
  attr_reader :order

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def print_menu
    @menu.print
  end

  def message
    Message.new.send_message
  end

end
