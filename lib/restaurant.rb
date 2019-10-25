require 'menu'

class Restaurant
attr_reader :new_menu

  def initialize
    @new_menu = Menu.new

  end

  def check
   puts @new_menu.show
  end




end
