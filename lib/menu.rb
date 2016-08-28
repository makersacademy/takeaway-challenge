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

  def show_items
    items.each do |item, price|
      puts item.capitalize.ljust(20)
      + price.to_s.capitalize.rjust(20)
    end
  end

  def on_menu?(item)
    items.key?(item)
  end

end
