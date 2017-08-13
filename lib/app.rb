
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
    command { puts "Welcome" }
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
    number = line.to_i
    if @order.select_dish(number)
      puts "selected dish: #{@menu.get_dish(number)[:name]}"
    else
      puts "#{line} is not a valid dish id"
    end
  end

  def complete
    summary = @order.complete
    @sms.send(phone_number, summary)
    puts 'order placed!'
    quit
  end

  def phone_number
    puts "please enter your phone number"
    gets.chomp
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
