require_relative 'formatter'
require_relative 'menu'
require_relative 'basket'
require_relative 'order'

# in lib/app.rb
class App
  attr_reader :order

  def initialize(order_klass = Order)
    @formatter = Formatter.new
    @menu = Menu.new(@formatter)
    @order_klass = order_klass
    @order = new_order
  end

  def run
    command { puts "Welcome" }
    loop do
      puts "#{options}"
      process_input(gets.chomp)
    end
  end

  private

  def new_order
    basket = Basket.new(@formatter)
    @order_klass.new(@menu, basket)
  end

  def process_input(line)
    case line
    when 'q'; command { quit }
    when 'm'; command { puts @menu.show }
    when 'b'; command { puts @order.show }
    when 'c'; command { complete }
    else; command { try_select_dish(line) }
    end
  end

  def command
    system('clear')
    yield
  end

  def try_select_dish(line)
    number = line.to_i
    if @order.select_dish(number)
      puts "selected dish: #{@menu.get_dish(number)[:name]}"
    else
      puts "#{line} is not a valid dish id"
    end
  end

  def complete
    summary = @order.complete
    # sent sms message with summary
    puts 'order placed!'
    @order = new_order
  end

  def options
    "enter the id for the dish you want to add and hit return.\n" +
    "or\n" +
    "m to view the menu\n" +
    "b to view your basket\n" +
    "c to complete your order\n" +
    "q to quit"
  end

  def quit
    puts 'exiting...'
    exit
  end
end
