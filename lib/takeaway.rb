class Takeaway
  attr_reader :menu

  def initialize(menu:)
    @menu = menu
  end

  def print_m
    menu.printing
  end

  
end
