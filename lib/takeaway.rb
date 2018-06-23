# for rspec testing
require './lib/menu'
# for irb testing
# require './menu'

class Takeaway

  def initialize(menu_list)
    @menu_list = menu_list.price_list
  end

  def print_menu
    p @menu_list
  end
end

# For running the program in irb
# menu = Menu.new
# takeaway = Takeaway.new(menu)
# takeaway.print_menu
