require_relative 'menu_display'

class Menu

  attr_reader :hash

  DEFAULT_MENU = {
    chips: 1,
    lentil_stew: 3,
    uncooked_pasta: 2
  }

  def initialize(hash: DEFAULT_MENU)
    @hash = hash
  end

end
