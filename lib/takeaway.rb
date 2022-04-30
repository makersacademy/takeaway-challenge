require './lib/menu.rb'

class Takeaway
  attr_reader :menu
  def initialize
    @menu = Menu.new
  end

  def show_menu
    @menu.show
  end
  
end