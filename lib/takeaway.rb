require_relative 'menu'

class Takeaway

  #attr_reader :menu
  def initialize(menu = Menu.new.starter)
    @menu = menu

  end

  def show_menu
    @menu
  end


end
