require_relative 'menu'
require_relative 'order'

class Restaurant

  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def launch!
    introduction
    home_page
  end

  def introduction
    puts "\n<<< Welcome to Spices of India >>>\n"
  end

  def home_page
    loop do
      puts "\nSelect an option:\n"
      puts "Type 'Menu' to View Menu"
      puts "Type 'Order' to Place Order"
      puts "Type 'Exit' to Leave\n"
      print "> "
      selection = gets.chomp.strip.downcase.to_sym
      process(selection)
    end
  end

  def process(selection)
    case selection
    when :menu
      @menu.print
      home_page
    when :order
      #
    when :exit
      conclusion
      exit
    else
      puts "Typing error. Please try again."
    end
  end

  def conclusion
    puts "\n<<< Goodbye! >>>\n\n"
  end

end
