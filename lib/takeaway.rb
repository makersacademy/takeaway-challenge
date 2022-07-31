#require 'menu'

# require '/Users/mariavalerogonzalez/Documents/My_Projects/Makers/challenges/takeaway-challenge/lib/takeaway.rb'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
  end

end