class Menu
  attr_reader :dish
 
  def initialize
    @dish = { "miso" => 8,
    "iekei" => 8,
    "charsiu" => 8,
    "shio" => 8,
    "shoyu" => 8,
    "tonkotsu" => 8,
    "hakata" => 8,
    "tatsuya" => 8
   }
  end

  def show_menu
    @dish.map { |food, price| "#{food}: £#{price}" }.join("\n")
  end

end
