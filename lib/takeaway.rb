require_relative 'menu'
class Takeaway
  attr_reader :menu
  def initialize
    @menu = Menu.new
  end

  def show_menu
    @menu.list
  end
end

t = Takeaway.new
p t.show_menu
