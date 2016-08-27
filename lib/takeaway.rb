require_relative 'menu'

class Takeaway

  def initialize (menu: menu)
    @menu = menu
  end

  def show_menu
    menu.print_menu
  end

private

attr_reader :menu
end
