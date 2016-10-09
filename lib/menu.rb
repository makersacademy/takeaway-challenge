class Menu

  attr_reader :dish, :price, :choose, :dish_choice

  def initialize
    @menu = [["Sabich", 6],
            ["Houmous", 4],
            ["Baba Ganoush", 4],
            ["Salona", 10],
            ["Shashuka", 9],
            ["Tabbouleh", 5],
            ["Pitta", 2],
            ["Falafel", 6]]
    @customer_selection = []
  end

  def display
    @menu.each do |dish, price|
      puts "#{dish} £#{price}"
  end
  end

end
