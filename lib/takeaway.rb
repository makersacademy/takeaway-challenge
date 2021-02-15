require './lib/menu'

class Takeaway

attr_reader :menu, :order, :number, :dish_number, :valid_number, :answer, :total

  def initialize
    @menu = Menu.new
    @order = Order.new
    @number = nil
    @dish_number = nil
    @valid_number = [1, 2, 3, 4]
    @answer = nil
    @total = 0.0
  end

  def order_start
    list_prices
    loop do
      order
      view_order
      continue?
      break if @answer == "no"
    end
    bill
  end

  def list_prices
    puts "below is a list of the items, with a dish number and price"
    puts @menu.menu
  end

  def order
    @answer = nil
    loop do
      puts "which dish number would you like to order?"
      @dish_number = gets.chomp
      break if @valid_number.include?(@dish_number.to_i)
      puts "dish does not exist, please enter a valid number"
    end
    select_amount
  end

  def select_amount
    puts "how many of this item would you like?"
    @number = gets.chomp
    puts "you have added #{@number} orders of dish number #{@dish_number} to your order"
    (@number.to_i).times{@order.tick(@menu.menu[@dish_number.to_i - 1])}
  end

  def continue?
    puts "would you like to continue? answer yes or no"
    @answer = gets.chomp
  end

  def bill
    @order.order.each{ |item| @total += item[:price].to_f}
    puts "your bill comes to #{@total}"
    text
  end

  def view_order
    puts "your order so far is as following"
    puts @order.order
  end

private

  def text
    puts "thank you for your order. you will receive a text message shortly confirming your order"
  end

end
