require_relative 'menu'
require_relative 'order'
require_relative 'messager'

class Restaurant

attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end


  def confirm_order
    send_message
  end

  def send_message
  end


end
