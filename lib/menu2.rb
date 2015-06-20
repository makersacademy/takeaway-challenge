class Menu

  attr_reader :menu

  def initialize
    @menu = { 'tempura'     => 8,
              'okonomiyaki' => 7,
              'yakisoba'    => 6,
              'gyoza'       => 3
            }
  end

  def show
    @menu
  end
end