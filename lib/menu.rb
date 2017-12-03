class Menu

  def initialize
    @menu = [
      { dish: "Eggplant Lasagne", price: 7.50 },
      { dish: "Spicy Soup", price: 6 },
      { dish: "Sweet Potato Fries", price: 8 },
      { dish: "Mushroom Pie", price: 7 }
    ]
  end

  def show_menu
    @menu.each { |line|
      puts "#{line[:dish]}    price: £#{line[:price]}".center(100)
    }
  end

end
