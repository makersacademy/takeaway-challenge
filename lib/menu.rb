class Menu
  attr_reader :menu
 
  def initialize
    @menu = { "miso": 8,
    "iekei": 8,
    "charsiu": 8,
    "shio": 8,
    "shoyu": 8,
    "tonkotsu": 8,
    "hakata": 8,
    "tatsuya": 8
   }
  end

  def show_menu
    @menu.map { |food, price| "#{food}: £#{price}" }.join("\n")
  end

end
