require './lib/menu.rb'

class Takeaway

  attr_accessor :menu

  def initialize(menu = Menu.new)
    @menu = menu.the_menu
  end

end
