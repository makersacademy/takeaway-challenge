require_relative 'menu'

class Takeaway

  attr_reader :basket

  def initialize(menu = Menu)
    @menu = menu.new
    @basket = {}
  end

  def view_menu
    @menu.pricelist
  end




end
