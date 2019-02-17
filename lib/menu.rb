require_relative('order')

class Menu

  attr_reader :full_menu

  def initialize
    @full_menu = {"Vindaloo" => 6, "Chips" => 3}
  end

  def show
    @full_menu
  end
end
