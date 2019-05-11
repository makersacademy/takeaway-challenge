require_relative 'menu'

class Takeaway

  def initialize
    @menu = Menu.new
  end

  def display(menu)
    menu.items
  end

end
