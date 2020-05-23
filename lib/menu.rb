class Menu

  TAKE_AWAY_NAME = "Costa del Oval"

  attr_reader :menu_list

  def initialize
    @customer_basket = []
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

  def select_items(customer_choice) 
    puts 'What would you like to order? Enter an item number.' 
    raise "Invalid number, please choose again" if customer_choice > 3

    @menu_list.each do |options|
      if customer_choice == options[:item_number]
        return options[:item]
      
      end
    end  
  end

end
