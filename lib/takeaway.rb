require_relative 'menu'

class Takeaway
  attr_reader :menu

  def initialize(menu:)
    @menu = menu
  end

  def display_menu
    menu.list_of_dishes
  end
end