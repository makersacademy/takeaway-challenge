require_relative 'menu'
require_relative 'messenger'

class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = nil
    @messenger = Messenger.new
  end

  def show_menu
    @menu.print_menu
  end

end
