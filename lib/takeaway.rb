require_relative 'menu'

class Takeaway

  def initialize(menu:)
    @menu = menu
  end

  def print_menu
    menu.print
  end

  private

  attr_reader :menu

end
