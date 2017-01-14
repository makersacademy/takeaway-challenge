require_relative 'ui_output'
require_relative 'menu'

class Takeaway

  include Menu
  include UiOutput

  def initialize(menu = ALL)
    welcome
    @menu = pretty_output(menu)
  end

  def welcome
    puts "Welcome to Shirt and Thai! Please look at the menu and make your selection"
  end

end

m = Takeaway.new
