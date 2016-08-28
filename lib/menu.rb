class Menu

  attr_reader :items

  ITEMS =    {"Nasty Noodles" => 8.95,
              "Philthy Pho" => 10.95,
              "Rancid Rice" => 3.95,
              "Springy Roll" => 4.95,
              "Dirty Duck" => 6.95,
              "Caustic Cake" => 5.95}

  def initialize(items = ITEMS)
    @items = items
  end

  def show_items
    items.each do |item, price|
      puts item.ljust(20) + price.to_s.rjust(20)
    end
  end

end
