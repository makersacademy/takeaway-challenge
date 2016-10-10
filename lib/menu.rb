class Menu

  require 'ap'
  require 'twilio-ruby'

  attr_reader :menu, :prices

  def initialize

    @menu = {
      1 => "Chicken Chow Mein (£6.75)",
      2 => "Pork Rendang (£5.50)",
      3 => "Pad Thai (£6.90)",
      4 => "Chicken Parmo (£4.50)",
      5 => "Paneer Korma (£5.50)",
      6 => "Onion Bahji (£2.50)"
    }

    @prices = {
      1 => 6.75,
      2 => 5.50,
      3 => 6.90,
      4 => 4.50,
      5 => 5.50,
      6 => 2.50
    }

  end

  def print_menu
    ap @menu
  end
end
