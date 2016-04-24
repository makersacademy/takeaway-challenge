class Takeaway

  def initialize(menu:)
    @menu = menu
  end

  def menu_display
    menu.display
  end

  private

  attr_reader :menu
end
