require_relative 'pretty_format'
require_relative 'menu'

class Takeaway

  include Menu
  include PrettyFormat

  def initialize
    puts "\nWelcome to Shirt and Thai!\n\nPlease take a look at our menu:"
    menu
  end

  def menu
    pretty_format(MENU)
  end

end

# require 'pry'
# binding.pry
# m = Takeaway.new
# m.view_menu
