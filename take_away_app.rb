require './lib/restaurant'

class TakeAwayApp

  def launch!
    introduction
    home_page
    process(STDIN.gets.chomp.strip.downcase.to_sym)
  end

  def home_page
    puts "\nSelect an option:\n"
    puts "Type 'Menu' to View Menu"
    puts "Type 'Order' to Place Order"
    puts "Type 'Exit' to Leave\n"
  end

  def process(selection)
    @restaurant = Restaurant.new
    case selection
    when :menu
      @restaurant.print_menu
      launch!
    when :order
      select_item
    when :exit
      conclusion
      exit
    else
      puts "Typing error. Please try again."
      launch!
    end
  end

  def select_item
    puts "What would you like to order?"
    @item = STDIN.gets.chomp.downcase.to_sym
    select_quantity
  end

  def select_quantity
    puts "How many would you like?"
    @quantity = STDIN.gets.to_i
    @order.add(@item, @quantity)
    add_extra
  end

  def add_extra
    puts "Anything else? ( yes / no )"
    extra = STDIN.gets.chomp.downcase
    "yes" ? select_item : finished?
  end

  def finished?
    puts "are you ready to checkout? ( yes / no)"
    answer = STDIN.gets.chomp.downcase
    "yes" ? exit : select_item
  end

  def introduction
    puts "\n<<< Welcome to Spices of India >>>\n"
  end

  def conclusion
    puts "\n<<< Goodbye! >>>\n\n"
  end

end
