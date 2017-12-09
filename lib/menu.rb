class Menu

  attr_accessor :menu_list

  def initialize
    @menu_list = [
      { id: '100', dish: "Eggplant Lasagne", price: 7 },
      { id: '101', dish: "Spicy Soup", price: 6 },
      { id: '102', dish: "Sweet Potato Fries", price: 4 }
    ]
  end

  def show_menu
    @menu_list.each { |line|
      puts "#{line[:id]}. #{line[:dish]}    price: £#{line[:price]}".center(100)
    }
  end

  def choose(dish_id)
    @menu_list[dish_id]
  end

end
