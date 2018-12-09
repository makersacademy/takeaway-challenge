require_relative 'menu'

class Takeaway

  attr_reader :current_order

  def initialize
    @menu = Menu
  end

  def show_menu
    @menu.load_menu
  end
end
