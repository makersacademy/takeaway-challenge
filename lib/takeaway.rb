require_relative 'menu'
require_relative 'notifier'

class Takeaway

  attr_reader :menu, :order, :notifier

  def initialize(menu = Menu.new, notifier = Notifier.new)
    @menu = menu
    @notifier = notifier
  end

  def display_menu
    @menu.read_menu
  end

  def create_order
    @menu.take_order
  end

  def complete_order(price)
    @menu.close_order(price)
  end

  def send_text(text)
    @notifier.send_message(text)
  end

end
