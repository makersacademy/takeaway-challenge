require_relative 'printer'
require_relative 'current_order'
require_relative 'twilio'



class MakeOrder

  attr_reader :printer_class

  def initialize(printer_class = Printer.new)
    @printer_class = printer_class
  end

# aaaaaaargh monster class
  def start
    puts "Welcome to our takeaway. Please peruse our menu below. To add a dish to your order, please type the dish NUMBER and hit Enter. When you are happy with your order, please type 'order' and hit Enter"
    @printer_class.printmenu
    raw = gets.chomp
    raw == 'order' ? selection = raw : selection = raw.to_i
    if selection == 'order'
      complete_order
    elsif !!Menu.new.dishes[selection]
      add_to_order(selection)
      start
    else
      p "That is not a valid choice, please try again"
      start
    end
  end

  def complete_order
    @printer_class.printsummary()
    $client.send_message
  end

  def add_to_order(num)
    $current_order ||= CurrentOrder.new
    $current_order.ordered_dishes << Menu.new.dishes[num]
    print @printer_class.printorder
  end

  def current_order
    $current_order
  end

end
