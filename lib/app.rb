require_relative 'colours'

# in lib/app.rb
class App
  attr_reader :order

  def initialize(sms, menu, basket_klass, order_klass, formatter)
    @formatter = formatter
    @basket_klass = basket_klass
    @order_klass = order_klass
    @menu = menu
    @order = new_order
    @sms = sms
  end

  def run
    command { puts BLUE + "Welcome" + ENDLINE }
    loop do
      puts "#{options}"
      process_input(gets.chomp)
    end
  end

  private

  def new_order
    basket = @basket_klass.new(@formatter)
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
    if number?(line) && @order.select_dish(line.to_i)
      puts GREEN + "selected dish: #{@menu.get_dish(line.to_i)[:name]}" + ENDLINE
    else
      puts RED + "#{line} is not a valid dish id" + ENDLINE
    end
  end

  def complete
    summary = @order.complete
    @sms.send(phone_number, summary)
    puts GREEN + 'order placed!' + ENDLINE
    quit
  end

  def phone_number
    puts "please enter your phone number"
    gets.chomp
  end

  def number?(line)
    line.to_i.to_s == line
  end

  def options
    "\nenter the id for the dish you want to add and hit return.\n" +
    "or\n" +
    "m to view the menu\n" +
    "b to view your basket\n" +
    "c to complete your order\n" +
    "q to quit"
  end

  def quit
    puts GREEN + 'exiting...' + ENDLINE
    exit
  end
end
