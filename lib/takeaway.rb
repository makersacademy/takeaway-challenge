require_relative 'menu'

class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def read_menu
    menu.show
  end

  private

  attr_reader :menu

end
