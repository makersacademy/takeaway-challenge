require_relative 'menu'

class Takeaway

  attr_reader :menu, :see_menu
  #
  # def initialize
  #   @menu =  Menu.new
  # end

  def see_menu
    @menu = Menu.new
    @menu.menu_list
  end


end
