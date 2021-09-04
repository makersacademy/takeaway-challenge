class EdsDiner

  def initialize 
    @dishes = { "1"=> { :name => "Tomato Soup", :price => 5 }, "2" =>{ :name => "Avocado On Toast", :price => 7 }, "3" => { :name => "Spaghetti Bolognese", :price => 12 }, "4" => { :name => "Mushroom Surprise", :price => 9 }, "5" => { :name => "Pizza", :price => 10 }, "6" => { :name => "Ice Cream", :price => 4}, "7" =>{ :name => "Cake", :price => 4 }} 
    @current_order = {}
    @order_options = {
      "1" => {:name => "Show Menu", :method => method(:show_menu)}, 
      "2" => {:name => "Add To Order", :method => method(:select_dishes)},
      "3" => {:name => "Show Current Order", :method => ""},
      "4" => {:name => "Order", :method =>""}
    }
  end

  attr_reader :dishes, :current_order

  def order
    title("Welcome to EdsDiner!")
    while true do
      puts "How can we help today? (choose number (e.g. 1) or type 'quit' to leave"
      break if handle_instruction == "quit"
    end
  end

  def show_menu 
    title("EdsDiner Menu:")
    @dishes.each do |number, dish| 
      puts "#{number}. #{dish[:name]}  £#{dish[:price]}"
    end
  end

  def select_dishes
    show_menu
    title("Select item by number (e.g. 1) or 'quit'")
    while true do
      break if handle_select(get_input) == "quit"
      puts "Select Again:"
    end
  end

  # def order_summary
  #   title("Your Order:")
  # end

  private

  def handle_instruction
    show_instructions
    input =get_input
    return "quit" if input == "quit"
    
  end

  def show_instructions
    @order_options.each do |num, option| 
      puts "#{num}. #{option[:name]}"
    end
  end

  def handle_select(item)
    return "quit" if item == "quit"
    if @dishes[item]
      add_to_current_order(item)
      confirm_item_added(item)
    else
      puts "Invalid Selection"
    end
  end

  def confirm_item_added(item)
    puts "You have added 1x #{dishes[item][:name]} to your order"
  end

  def add_to_current_order(item)
    @current_order[item] ? @current_order[item] += 1 : @current_order[item] = 1
  end


  def get_input
    input = gets.chomp
  end

  def title(text)
    puts " "
    puts text
    ((text.length) - 1).times { print "~" }
    puts "~"
  end
end
