require './lib/menu.rb'
class TakeAway
  attr_reader :basket, :menu

  def initialize
    @basket = []
    @menu = Menu.new
  end

end
