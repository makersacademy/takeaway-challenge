
class TakeAway

  def initialize(menu: menu)
    @menu = menu
  end

  def read_menu
    menu.read
  end

  private

  attr_reader :menu
end
