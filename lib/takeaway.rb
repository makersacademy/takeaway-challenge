class Takeaway
  attr_reader :menu

  def initialize(menu:)
    @menu = menu.display
  end

  def display_menu
    'Chicken Tikka Masala: £6.50'
  end
end
