require_relative 'menu'

class Takeaway
  def initialize(menu=Menu.new)
    @menu = menu
  end

  def fetch_menu
    @menu.get_menu
  end

  def show_menu
    fetch_menu
    menu.each do |item|

end