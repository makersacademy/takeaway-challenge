require_relative './printer'
require_relative './order'
require_relative './Send_SMS'

class Restaurant

  include Printer

  attr_reader :menu

  def initialize
    @menu = {
      trout_snout: 6.50,
      hog_soup: 4.90,
      mysterious_dumpling: 8.00,
      boring_sandwich: 4.00,
      cuttlefish_pate: 11.00,
      hoof_broth: 3.30
    }
  end

  def print_menu(printer = Printer)
    printer.menu_printer(@menu)
  end

  def create_order(order = Order)
    @order = order.new
    @running_total = []
  end

  def choose_dish
    puts "Enter selection (number)"
    @choice = $stdin.gets.chomp
    @choice = @menu.to_a[@choice.to_i - 1]
  end

  def choose_quantity
    puts "Enter quantity (number)"
    @quantity = $stdin.gets.chomp.to_i
    @quantity.times { @order.add(@choice) }
    @quantity.times { @running_total.push(@choice[-1]) }
  end

  def check_bill
  #  @comparison_total = []
    raise "CALCULATION ERROR" if @running_total.sum != @order.total
  end

  def print_receipt(printer = Printer)
    printer.receipt_printer(@order)
  end

  def text_confirmation(sender = Send_SMS)
    time_calculator
    sender.send(@delivery_time)
  end

  def time_calculator
    time = (Time.now + 3600)
    @delivery_time = time.strftime("%k:%M")
    @delivery_time
  end

end
