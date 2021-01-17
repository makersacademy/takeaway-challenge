require_relative 'takeaway'

class Menu
attr_accessor :dishes

  def initialize
    @dishes = {hamburger: 3.99, tacos: 4.99, spaghetti: 5.99, fries: 4.59 }
  end

end
