require 'menu'

class Ui
  attr_reader :menu

  def initialize (menu = Menu.new([]))
    @menu = menu
  end

  def display
    puts menu.display_dishes
  end
end
