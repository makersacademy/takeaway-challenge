require_relative 'menu'

class Order

  def initialize 
    @customer_basket = []
    @menu = Menu.new.menu_list
  end

  def show_menu
    Menu.new.show_list
  end

  def select_items(customer_choice) 
    puts 'What would you like to order? Enter an item number.' 
    raise "Invalid number, please choose again" if customer_choice > 3
    
    puts @menu

    @menu.each do |options|
      if customer_choice == options[:item_number]
        return options[:item]
      end
    end
  end
end
