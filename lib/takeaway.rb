class Takeaway

  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

  def print_dishes
    menu.list_dishes
  end



end
