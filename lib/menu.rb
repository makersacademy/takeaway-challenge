require_relative 'takeaway'

class Menu
attr_reader :menu

  def initialize
    @menu = {hamburger: 3.99,
                      tacos: 4.99,
                      spaghetti: 5.99,
                      fries: 4.59 }
  
  end

end