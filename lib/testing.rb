


  @chinese_menu = {
    "Chicken with lemon sauce"  =>  4.00,
    "Chinese Roasted Pork"      =>  4.00,
    "Chicken with pineapple"    =>  4.50,
    "Roasted Duck"              =>  8.00,
    "Mixed Vegetables"          =>  5.00,
    "King Prawns"               =>  3.25
  }

  def initalize
    @total = 0.00
    @chinese_menu
    @current_order = []
  end


  def display_menu
    puts  "Menu items"
    puts "----------"
    @chinese_menu.each {|key, value| puts "#{key}: #{value}" }
  end


  def select_items
    puts "Here are the available dishes: "
    puts displ#create a display menu method
    puts  "Type in dish to select a dish"
        dish_selection = "Roasted Duck" #CHANGE BACK
        if @chinese_menu.key?(dish_selection)
          @current_order << @chinese_menu.assoc(dish_selection)
          dish_selection = "Roasted Duck" #CHANGE
          @current_order << @chinese_menu.assoc(dish_selection)
          dish_selection = "Mixed Vegetables" #CHANGE
        else
          quit
        end
    end

  def confirm_order
    puts "Your current order is: "
    @order_array.each{ |x|
      "Dish: #{x[0]} Cost: #{x[1]}"
       @total += x[1]
      }
      puts "Your current total is: #{@total}"
      puts "Proceed to payment"
  end


  def remove_item(removed_item)
    if @current_order.include? removed_item
        item_removed = @current_order.find(removed_item)
        #deduct amount from the total
        @total -= item_removed[1]
        @current_order.remove(item_removed)
        puts "The item has been removed from your order."
        puts "Your new balance is #{total}"
    else
      puts "This item is not a part of your order"
    end
  end


select_items
