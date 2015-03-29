class Menu
  attr_reader :menu
  alias_method :list, :menu

  def initialize(menu_hsh = {})
    if menu_hsh.empty? || !menu_hsh.instance_of?(Hash)
      fail 'Invalid Input, Try Initializing Menu with Hash'
    end
    @menu = menu_hsh
  end
end
