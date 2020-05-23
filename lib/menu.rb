class Menu

  TAKE_AWAY_NAME = "Costa del Oval"

  attr_reader :menu_list

  def initialize
    @menu_list = [{ item_number: 1, item: "Veggie Burger and Sweet Potato Fries", price: 3 }, 
                   { item_number: 2, item: "Veggie Lasagna", price: 5 }, 
                   { item_number: 3, item: "Falafel and Hallumi Wrap", price: 4 }]
  end

  def show_list
    puts TAKE_AWAY_NAME + " Menu"
    @menu_list.each do |hash| 
      puts "#{hash[:item_number]}. #{hash[:item]}: £#{hash[:price]}"
    end
  end
end
