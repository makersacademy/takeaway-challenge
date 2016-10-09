class Menu

  attr_reader :dish, :price

  def initialize
    @menu = [["Sabich", 6],
            ["Houmous", 4],
            ["Baba Ganoush", 4],
            ["Salona", 10],
            ["Shakshuka", 9],
            ["Tabbouleh", 5],
            ["Pitta", 2],
            ["Falafel", 6]]
  end

  def display
    @menu.each do |dish, price|
      puts "#{dish} £#{price}"
  end
  end
end
