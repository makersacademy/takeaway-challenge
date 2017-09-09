require_relative 'menu'

class Takeaway

  def initialize
    @menu = Menu.new
  end

  def see_menu
    puts "All prices in GBP"
    @menu.menu_entries
  end

end
