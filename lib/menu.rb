class Menu
  attr_reader :items

  def initialize
    @items = [
  { "Buckwheat Shamalam" => 5.00 },
  { "Avocado Foxtrot" => 6.50 },
  { "Crusty Snickerdoodle" => 4.50 },
  { "Froffee Coffee" => 3.50 },
  { "Realitea" => 2.00 },
  { "Mystery Item" => 10.00 }
  ]
  end

  def print_menu
    return items
  end
end
