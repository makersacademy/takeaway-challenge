require_relative 'menu'

class Takeaway
  attr_reader :menu
  def initialize
    @menu = Menu.new
  end

  def show_menu

  end
end
