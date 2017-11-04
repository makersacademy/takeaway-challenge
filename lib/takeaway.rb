require './lib/menu.rb'
class TakeAway
  attr_reader :basket, :menu

  def initialize
    @basket = []
    @menu = Menu.new
  end

  def read_menu
    @menu.read_menu
  end

end
