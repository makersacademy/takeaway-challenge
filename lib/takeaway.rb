class TakeAway
  def initialize(menu_class:)
    @menu = menu_class
  end

  def display_menu
    menu.show
  end

  private

  attr_reader :menu
end
