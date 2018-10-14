class Menu

  attr_reader :menu

  def initialize(menu = {
                          "fish" => 10,
                          "steak" => 20,
                          "chips" => 4,
                          "pie" => 12
                        })

    @menu = menu
  end
end
