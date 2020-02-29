require_relative 'menu'

class Takeaway

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
  end



  
end