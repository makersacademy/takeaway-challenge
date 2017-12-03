require './lib/menu.rb'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu.the_menu
  end

end
