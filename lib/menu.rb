class Menu

  DEFAULT_MENU = {"dumplings" => 3.99, "cheeseburger" => 5.99,
                 "peking duck" => 10.99}

  attr_reader :menu

  def initialize
    @menu = DEFAULT_MENU
  end
end
