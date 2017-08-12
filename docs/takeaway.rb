require './docs/menu.rb'

class Takeaway
  attr_reader :name

  def initialize
  end

  def show_menu
    Menu.new.display
  end
end
