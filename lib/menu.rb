class Menu 
  attr_reader :menu

  def initialize
    @menu = {
        "Margherita" => 12.50,
        "Carbonara" => 15,
        "Lasagna" => 16,
        "Penne almodoro" => 19.99
    }
  end

  def display_menu
    @menu.map { |food, price| "#{food}: £#{price}" }
  end
end