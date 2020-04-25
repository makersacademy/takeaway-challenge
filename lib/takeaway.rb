require_relative 'menu'

class TakeAway
  attr_reader :menu

  def initialize
    @menu = Menu.new
  end

  def menu_list 
    @menu.print
  end

end