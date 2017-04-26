# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

# It understands how to display a Menu

class Menu
  attr_reader :menu

  def display
    @menu.each  {|key, value| puts "#{key} - £#{value}"}
  end

  private

  def initialize
    @menu = {"Salad" => 5,
      "Pizza" => 8,
      "Pasta" => 9,
      "Burger" => 5,
      "Fish & Chips" => 6,
      "Chips" => 3}
  end

end
