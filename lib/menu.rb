require_relative 'takeaway'

class Menu
attr_reader :menu

  MENU = {hamburger: 3.99, tacos: 4.99, spaghetti: 5.99, fries: 4.59 }

  def initialize
    @menu = MENU
  end

end