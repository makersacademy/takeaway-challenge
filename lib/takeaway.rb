require 'menu'

class Takeaway
  attr_reader :menu

  def initialize
    @menu = Menu::TODAYS_MENU
  end

end
