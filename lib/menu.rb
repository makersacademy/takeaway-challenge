class Menu

  attr_reader :menu

  def initialize
    @menu = {:STARTERS => {"Onion Bhaji" => 2.95, "Samosa" => 2.95},
    :MAINS => {"Duck Tikka" => 8.95, "Lamb Balti" => 6.95},
    :SIDES => {"Sag Aloo" => 2.95, "Special Fried Rice" => 2.95 }
    }
  end

  def list
    @menu.each do |heading, dishes|
      puts heading.to_s
      dishes.each { |dish, cost| puts dish + " - £#{cost}" }
    end
  end

end
