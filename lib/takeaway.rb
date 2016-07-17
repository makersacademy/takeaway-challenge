require 'menu'
require 'sms'

class Takeaway

  def initialize(menu: )
    @menu = menu

  end

  def print_menu
    menu.print
  end

  def add_item(dish)

  end

  def place_order

  end

  private

  attr_reader :menu

end
