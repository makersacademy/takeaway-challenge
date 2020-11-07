require_relative './menu.rb'

class Rest
  attr_reader :menu
  def initialize
    @menu = Menu::MENU
  end
end
