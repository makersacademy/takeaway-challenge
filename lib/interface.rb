require_relative 'printer'
require_relative 'basket'
require_relative 'list'
require_relative 'order'

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

  private

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
      return puts "Your basket is empty\n\n" if @basket.empty?

      show_basket
    when "3"
      add_dishes_dialogue
    when "4"
      clear_basket
    when "5"
      @order.checkout(@basket)
    when "6"
      puts "I'm closing down"
    else
      puts "Please select the correct option\n\n"
    end
  end

  def show_basket
    @printer.view_basket(@basket)
    puts "Your total is £ #{@order.total(@basket)}\n\n"
  end

  def add_dishes_dialogue
    puts "Which dish are you choosing?"
    @dish = gets.chomp.downcase.to_sym
    category_selector
    return puts "We don't serve this dish\n\n" unless @category
  
    puts "How many do you want?"
    @quantity = gets.chomp.to_i
    add_dishes
  end

  def add_dishes
    @quantity.times { @basket.add({ @dish => @list.list[@category][@dish] }) }
    puts "#{@quantity} #{@dish.to_s.capitalize} added to your basket\n\n"
  end

  def clear_basket
    @basket.clear
    puts "Your basket is now empty\n\n"
  end

  def category_selector
    if [:margherita, :marinara, :nduja, :bufala, :parma].include?(@dish)
      @category = :pizza
    elsif [:pomodoro, :bolognese, :gamberi, :lasagna].include?(@dish)
      @category = :pasta
    elsif [:salmon, :milanese, :burger].include?(@dish)
      @category = :main
    elsif [:water, :coke, :red, :white].include?(@dish)
      @category = :drink
    else
      @category = nil
    end
  end
end
