require 'takeaway'
class Takeaway

  def initialize(menu:) #is injected menu
    @menu = menu
  end

  def print_menu
    menu.print

  end

 private

 attr_reader :menu  #menu accesable

end
