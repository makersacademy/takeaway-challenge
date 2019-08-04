class Menu

  # Menu hash
  def dishes
    { "spaghetti bolognese": 6.5, 
      "veggie burger": 7.5,
      "stir fried rice": 5.0,
      "cherry tomato soup": 4.8,
      "pad thai noodles": 7.0,
      "grilled chicken salad": 7.5,
      "vanilla ice cream": 3.0,
      "fudge chocolate cake": 3.5,
      "classic mojito": 4.5,
      "lemonade": 2.0,
      "apple juice": 2.0 } 
  end
  # Converts menu items into a list that is numbered and priced
  def list
    @menu = []
    num = 0
    dishes.each do |k,v| 
      @menu << "#{num += 1}. #{k} £#{v}0"
    end
    @menu
  end
  # Prints menu on the screen
  def view
    puts list
  end
end

# menu.rb is responsible for storing menu 
