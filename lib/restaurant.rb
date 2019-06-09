class Restaurant
  def initialize(menu:)
    @menu = menu
  end

  def print_menu
    menu.print_menu
  end

  private

  attr_reader :menu
end
