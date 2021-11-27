require_relative 'menu'

class Takeaway
  
  attr_reader :menu, :dishes

  def initialize
    @print_menu = print_menu
  end

  def print_menu
    @dishes
  end
end
