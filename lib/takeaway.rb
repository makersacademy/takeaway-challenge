class Takeaway

  def initialize(menu:)
    @menu = menu
  end

  def print_menu
    menu.print_format
  end

  private
  attr_reader :menu
end
