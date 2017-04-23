require_relative 'list'
require_relative 'waiter'

class Restaurant

  def initialize
    @menu = List.new
    @waiter = Waiter.new
  end

  def view_menu(file = nil)
    file.nil? ? menu.view_items : menu.view_items(file)
  end

  def place_order(order)
    waiter.place_order(order)
  end


  private

  attr_reader :menu, :waiter

end
