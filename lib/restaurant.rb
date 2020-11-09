require_relative 'menu'

class Restaurant

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    @menu.send
  end

  def check_availability(item)
    @menu.available?(item)
  end

  def item_price(item)
    @menu.price?(item)
  end

end