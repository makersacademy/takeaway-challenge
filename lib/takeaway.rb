require 'menu'
require 'sms'

class Takeaway

  def initialize(menu: , sms: nil)
    @menu = menu
    @sms = sms || SMS.new
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
