class Menu

  attr_reader :menu

  MENU = :pizza, :chips, :kebab, :burger, :sushi, :fried_chicken

  def initialize
    @menu = {
      :pizza => 2.00,
      :chips => 2.00,
      :kebab => 2.00,
      :burger => 2.00,
      :sushi => 2.00,
      :fried_chicken => 2.00
      }
  end

end
