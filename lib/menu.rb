class Menu

  # Replaces method 'def dish_list_with_prices  @dish_list_with_prices  end'
  attr_reader :dish_list_with_prices

  def initialize
    # List of dishes stored in instance of menu; Order class uses dependency on Menu class
    @dish_list_with_prices = {'Egg Fried Rice' => 3, 'Prawn Crackers' => 2, 'Sweet and Sour Chicken' => 5, 'Beef Chow Mein' => 2.50}
  end

  def print_menu
    # Create variable 'printed_menu', use .keys to output an array of all keys in hash
    printed_menu = @dish_list_with_prices.keys
    # Output array as single strings with items separated by commas
    printed_menu.join(", ")
  end

  def print_menu_with_prices
    # For each of items in @dish_list_with_prices array,
    # output text string with name and price (2 d.p);
    # Add that text string to temporary array
    # Join the temporary array with commas to produce full string
    temp = []
    @dish_list_with_prices.each do |name, price|
      description = "#{name}: £#{'%.2f' %price}"
      temp << description
    end
    temp.join(", ")
  end

end
