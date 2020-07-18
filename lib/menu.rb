class Menu

  attr_reader :menu

  def initialize
    @menu = {
      :padthai => 6.00,
      :massamancurry => 7.00,
      :bokchoi => 2.00,
      :rice => 1.00
    }
  end

  def view_menu
    @menu
  end
end
