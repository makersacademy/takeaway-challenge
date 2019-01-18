class Menu

  attr_reader :menu

  DEFAULT_MENU = {
    chips: 1,
    lentil_stew: 3,
    uncooked_pasta: 2
  }

  def initialize(menu = DEFAULT_MENU)
    @menu = menu
  end

end
