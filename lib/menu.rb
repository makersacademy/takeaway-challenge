class Menu
attr_reader :menu

  def initialize
    @menu = { "Sushi" => 5, 
    "Curry" => 6, 
    "Egg roll" => 2, 
    "Soup" => 1 }
  end

  def display
    @menu.each do |dish, price|
      p "#{dish}: £#{price}"
    end
  end


end