require_relative './menu.rb'
require_relative './twilio.rb'

class Order

  attr_reader :user_order, :menu, :tot, :text

  def initialize(menu = Menu.new, text = Text.new)
    @user_order = []
    @menu = menu
    @list = menu.generate_menu
    @text = text
  end

  def display_menu
    @menu.display
  end

  def add_to_order(quantity, dish)
    return 'Quantity must be an integer.' unless quantity.is_a? Integer
    return 'Dish must be in the menu.' unless available?(dish)
    @user_order << [quantity, dish]
  end

  def available?(dish)
    return false unless dish.is_a?(Dish)
    @list.each do |v|
      return true if (v.name == dish.name) and (v.price == dish.price)
    end
    return false
  end

  def calculate_payment
    @tot = 0
    @user_order.each { |v| @tot += v.last.price * v.first }
    @tot
  end

  def show_bill
    return "You did not order anything" if @user_order == []
    dishes = "You ordered:\n"
    @user_order.each { |v| dishes << v.last.name + " x" + v.first.to_s + " \n" }
    calculate_payment
    puts dishes << "TOTAL: #{@tot} £"
  end

  def payment_wrong?
    show_bill
    puts 'If you agree with this bill, please introduce the amount to be paid'
    money = gets.chomp
    int = money.to_i
    int != @tot
  end

  def finish_order
    fail 'Incorrect payment' if payment_wrong?
    @text.send
  end

end
