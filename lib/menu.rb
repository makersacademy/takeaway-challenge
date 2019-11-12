class Menu
  attr_accessor :menu

  def initialize
    @menu = [
      { "meal" => "Fish", "price" => 2 },
      { "meal" => "Chips", "price" => 1 },
      { "meal" => "Hamburger", "price" => 2 },
      { "meal" => "Spaghetti", "price" => 2 },
      { "meal" => "Salad", "price" => 1 },
    ]
  end

  def list
    @menu.map {|x|
      puts "#{x.values[0]}: £#{x.values[1]}"
    }
  end

end
