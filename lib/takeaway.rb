require_relative 'menu'

class Takeaway

  attr_reader :current_order

  def initialize
    @menu = Menu
    @current_order = Menu
  end

  def show_menu
    @menu.load_menu
  end

  private

  def current_order
    current_order ||= Order.new
  end
end
