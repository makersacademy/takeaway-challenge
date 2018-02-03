require_relative 'menu'
require_relative 'order'

class Restaurant

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def launch!
    introduction
    home_page
    process(STDIN.gets.chomp.strip.downcase.to_sym)
  end

  def introduction
    puts "\n<<< Welcome to Spices of India >>>\n"
  end

  def home_page
    puts "\nSelect an option:\n"
    puts "Type 'Menu' to View Menu"
    puts "Type 'Order' to Place Order"
    puts "Type 'Exit' to Leave\n"
  end

  def process(selection)
    case selection
    when :menu
      @menu.print
      launch!
    when :order
      @menu.select_item
    when :exit
      conclusion
      exit
    else
      puts "Typing error. Please try again."
      launch!
    end
  end

  def conclusion
    puts "\n<<< Goodbye! >>>\n\n"
  end

end
