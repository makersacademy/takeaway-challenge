class Menu


attr_accessor :cereals

  def initialize
    @cereals = {

      "Lucky Charms" => 2,
      "Frosties" => 1,
      "Coco Pops" => 3

    }
  end

  def cereals_count
    cereals.count
  end

  def price(price)
    @cereals[price]
  end

  def display_menu
    @cereals.each do |key, value|
      print key, ": ", value, "\n"
    end
  end

end