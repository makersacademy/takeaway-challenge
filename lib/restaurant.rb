require_relative 'menu'

class Restaurant
  attr_reader :menu, :customer_order

  def initialize(menu: Menu.new)
    @menu = menu
    @customer_order = []
  end

  def request_menu
    menu.view
  end

  def order
    @customer_order = []
    ordering_instructions
    take_order
    customer_order
  end

  private

  def ordering_instructions
    puts "Please enter your order in this format- "
    puts "Dish : quantity"
    puts "Type 'total' : 'total order amount' when done"
    puts "e.g. total : 30"
  end

  def take_order
    while true
      answer = gets.chomp
      answer = answer.split(":").each{|x| x.strip! }
      customer_order << answer
      break if customer_order[-1][0].match(/total/i)
    end
  end
end
