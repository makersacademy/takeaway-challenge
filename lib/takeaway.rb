require_relative 'menu'

class Takeaway

  attr_reader :chosen_items, :menu_class

  def initialize(menu_class = Menu.new)
    @menu_class = menu_class
    @chosen_items = Hash.new(0)
  end

end
