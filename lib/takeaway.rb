class TakeAway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = Order.new
    @dish_number = nil
    @valid_number = [1, 2, 3, 4, 5]
    @answer = nil
    @number = nil
    @total = 0.0
  end

  def start_order
    view_menu
    loop do
      order
      view_order
      continue?
      break if @answer = no
    end
    bill
  end

  def view_menu
    puts "Feast your eyes on our tasty rare delicacy menu :)"
    puts @menu.menu
  end

  def order
    @answer = nil
    loop do
      puts "Please choose a dish number"
      @dish_number = gets.chomp
      break if @valid_number.include?(@dish_number.to_i)
      puts "sorry we don't have that dish number, please enter one of the numbers
            on our menu."
    end
    select_amount
  end

  def select_amount
    puts "How many would you like?"
    @number_input = gets.chomp
    puts "You've got #{@number_input} of the #{@dish_number} in your basket"
    (@number_input.to_i).times{@order.select(@menu.menu[@dish_number.to_i - 1])}
  end

  def view_order
    puts "Your scrumptious order so far"
    puts @order.order
  end

  def continue?
    puts "Would you like to order more?"
    @answer = gets.chomp
  end

  def bill
    @order.order.each{ |item| @total += item[:price].to_f }
    puts "Your final bill is #{@total}"
    text
  end

  private

  def text

end
