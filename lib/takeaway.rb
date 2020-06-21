class Takeaway

  def initialize(menu:)
    @menu = menu
  end

  def list_menu
    menu.print

  end

  private

  attr_reader :menu

end