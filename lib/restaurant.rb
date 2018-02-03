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
    loop do
      puts "Select 'menu' to view meals"
      print "> "
      user_response = gets.chomp
      # do that action
      result = do_action(user_response)
      # repeat until user quits
      break if result == :quit
    end
    conclusion
  end

  def do_action(action)
    case action
    when 'menu'
      @menu.print
    when 'add'
      #
    when 'remove'
      #
    when 'view'
      #
    when 'checkout'
      #
    end
  end

  def introduction
    puts "\n<<< Welcome to Spices of India >>>\n"
  end

  def conclusion
    puts "\n<<< Goodbye! >>>\n\n"
  end

end
