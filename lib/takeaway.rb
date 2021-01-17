require_relative 'menu'
class Takeaway
  def initialize(menu)
    @menu = menu
  end

  def show_menu
    menu.display
  end

  def order(dish)
    puts "1x #{dish} added to basket"
  end

  private #-------------------------------
  attr_reader :menu
end
