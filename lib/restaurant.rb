require_relative 'menu'

class Restaurant

  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def launch!
    introduction
    # action loop
    loop do
      # what do you want to do? (add, remove etc)
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
