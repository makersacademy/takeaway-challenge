class Shop

  attr_reader :menu

  def initialize
    @menu = { 'lasagne' => 10.50,
              'fish_and_chips' => 8,
              'linguine'  => 12,
              'red_wine' => 15.50,
              'beer' => 4.5,
              'cheese_cake' => 3}
  end

  def show_menu
    @menu
  end

end