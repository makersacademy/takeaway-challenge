require './lib/menu.rb'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    @menu.show
  end
end
