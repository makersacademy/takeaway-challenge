class Menu

  DEFAULT_MENU = {
    "starter" => 1,
    "main" => 2,
    "dessert" => 3
  }

  attr_reader :items

  def initialize(items = DEFAULT_MENU)
    @items = items
  end

  def show
    @items.map {|item, price|
     "#{item.capitalize}: £#{price}"
   }.join("\n")
  end

end
