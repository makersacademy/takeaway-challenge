class Menu

  def initialize
    @menu_options = [
      "1. Chips Price £1.00",
      "2. Cheese Burger Price: £2.50",
      "3. Hot Dog Price: £2.00",
      "4. Chilli Dog Price: £3.50",
      "5. Can of drink Price: £0.50"]
    @menu_prices = [1.00, 2.50, 2.00, 3.50, 0.50]
  end

  def view
    @menu_options.each do |item|
      puts item
    end
  end

end
