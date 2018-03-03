require_relative './menu.rb'

class Takeaway

  def initialize(menu:)
    @menu = menu
  end

  def read_menu
    menu.show_menu
  end

  private

  attr_reader :menu

end
