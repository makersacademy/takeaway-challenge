class TakeAway

  attr_reader :selection

  def initialize(menu)
    @menu = menu
  end

  def print_menu
    @menu.show
  end

end
