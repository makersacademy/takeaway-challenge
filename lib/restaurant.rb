require_relative 'messager'
require_relative 'menu'
class Restaurant

  attr_reader :menu

  def initialize(messager_klass: Messager.new, menu_klass: Menu.new)
    @messager = messager_klass
    @menu = menu_klass.menu
  end

  def add_item(dish, price)
    @menu[dish] = price
  end

  def finish(summary)
    message = "Your receipt is as follows: " + summary
    send_text(message)
  end

  private

  def send_text(message)
    @messager.send_sms(message)
  end

end
