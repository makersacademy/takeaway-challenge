class Menu
  attr_reader :menu
  alias_method :list, :menu

  def initialize(menu_hsh = {})
    @menu = menu_hsh
  end
end
