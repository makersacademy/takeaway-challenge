class Takeaway
  def initialize(menu:)
    @menu = menu
  end
  def printed_menu
    menu.print
  end
  private
  attr_reader :menu

end
