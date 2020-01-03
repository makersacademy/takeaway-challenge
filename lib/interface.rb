require_relative 'printer'
require_relative 'basket'
require_relative 'list'
require_relative 'order'
require_relative 'text'

class Interface
  def initialize(basket: Basket.new, printer: Printer.new, list: List.new, order: Order.new)
    @basket = basket
    @printer = printer
    @list = list
    @order = order
  end

  def start
    loop do
      menu
      choice
      selector
      break if @choice == "6"
    end
  end

  def menu
    puts "1. View menu"
    puts "2. View basket"
    puts "3. Add dish to basket"
    puts "4. Clear basket"
    puts "5. Place order"
    puts "6. Exit\n\n"
    puts "Please choose your option"
  end

  def choice
    @choice = gets.chomp
    puts "You choose #{@choice}\n\n"
  end

  def selector
    case @choice
    when "1"
      @printer.print(@list)
    when "2"
      puts "Your basket is empty\n\n" if @basket.basket.empty?
      return if @basket.basket.empty?

      @printer.view_basket(@basket)
      puts "Your total is #{@order.total(@basket)}\n\n"
    when "3"
      puts "Which dish are you choosing?"
      dish_converter
      unless @category.nil?
        puts "How many do you want?"
        quantity = gets.chomp.to_i
        quantity.times { @basket.add({@dish => @list.list[@category][@dish]}) }
        puts "#{quantity} #{@dish.to_s.capitalize} added to your basket\n\n"
      end
    when "4"
      @basket.clear
      puts "Your basket is now empty\n\n"
    when "5"
      @order.checkout(@basket)
    when "6"
      puts "I'm closing down"
    else
      puts "Please select the correct option\n\n"
    end
  end

  def dish_converter
    @dish = gets.chomp.downcase.to_sym
    if [:margherita, :marinara, :nduja, :bufala, :parma].include?(@dish)
      @category = :pizza
    elsif [:pomodoro, :bolognese, :gamberi, :lasagna].include?(@dish)
      @category = :pasta
    elsif [:salmon, :milanese, :burger].include?(@dish)
      @category = :main
    elsif [:water, :coke, :red, :white].include?(@dish)
      @category = :drink
    else
      puts "We don't serve this dish\n\n"
      @category = nil
    end
  end
end
