class Takeaway

  attr_reader :menu

  def initialize
    @menu = Dishes.new
  end

  def print_menu
    @menu.list
  end


end
