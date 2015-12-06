require_relative 'menu'

class Restaurant
  attr_reader :menu, :customer_order, :actual_total

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
    fail "Your order is incorrect" unless customer_total_correct?
    customer_order
  end

  private
  attr_reader :customer_total

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

  def customer_total_correct?
    calculate_customer_total
    calculate_actual_total
    customer_total == actual_total
  end

  def calculate_customer_total
    @customer_total = customer_order[-1][-1].to_i
  end

  def calculate_actual_total
    @actual_total = 0
    customer_order.each do |item|
      if menu.list.has_key?(item[0])
        @actual_total += ((item[1].to_i) * menu.list[item[0]])
      end
    end
    actual_total
  end
end
