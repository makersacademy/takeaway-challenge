class Menu

  attr_reader :items

  ITEMS =    {"nasty noodles" => 8.95,
              "philthy pho" => 10.95,
              "rancid rice" => 3.95,
              "springy roll" => 4.95,
              "dirty duck" => 6.95,
              "caustic cake" => 5.95}

  def initialize(items = ITEMS)
    @items = items
  end

  def on_menu?(item)
    items.key?(item)
  end

  def check_price(item)
    items[item]
  end

end
