# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
require_relative 'menu'

class Takeaway

  def initialize
    @menu = Menu.new
  end

  def view
    @menu.view
  end

end
