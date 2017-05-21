require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_accessor :order, :add

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def print_menu
    @menu
  end

end
