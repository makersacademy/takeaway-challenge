class Takeaway

@print_menu = { test: 1,
  test: 2}

  def initialize(menu:)
    @menu = menu
  end

  def print_menu
    menu.print
  end


private

  attr_reader :menu
end
