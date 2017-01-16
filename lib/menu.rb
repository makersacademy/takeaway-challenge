class Menu

  attr_accessor :menu

  def initialize
    @menu = { 'Pizza' => 8.90,
    'Pasta' => 6.90,
    'Soup' => 4.75,
    'Tiramisu' => 4.50,
    'Coffee' => 2.50,
    'Red wine' => 3.50,
    'Grappa' => 2.50 }
  end

  def contains(item)
    @menu.has_key?(item)
  end
end
