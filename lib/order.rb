require_relative 'menu'
require_relative 'takeaway'

class Order

  attr_accessor :chosen_items


  def initialize(menu = Menu.new)
    @menu = menu
    @chosen_items = []
  end

  
end
