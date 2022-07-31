class Takeaway
  attr_reader :menu

  def initialize(menu:)
    @menu = menu
  end

  def list_menu
    menu.list
  end
end
