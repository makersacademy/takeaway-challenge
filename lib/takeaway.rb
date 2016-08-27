require_relative 'menu'

class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def read_menu
    menu.show_dishes
  end

  private

  attr_reader :menu

end
