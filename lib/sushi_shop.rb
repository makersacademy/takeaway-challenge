require_relative "takeaway_shop.rb"

class SushiShop < TakeawayShop

  attr_reader :menu

  def initialize
    @menu = { "Tuna"      => 3.00,
              "Eel"       => 5.00,
              "Egg"       => 1.50,
              "Salmon"    => 3.50,
              "Sea weed"  => 1.95,
              "Sake"      => 9.50,
              "Miso soup" => 1.00  }
  end

end
