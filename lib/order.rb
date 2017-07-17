require_relative 'menu'
require_relative 'message'

class Order

  attr_reader :menu, :basket

  def initialize(menu = Menu.new, message = Message.new)
    @menu = menu
    @basket = Hash.new
    @message = message
  end

  def read_menu
    menu.print_menu
  end

  def order_dish(name, quantity)
    raise "Sorry, this dish is not included in the menu" unless menu.dish_included?(name)
    @basket[name] = quantity
    puts "#{name.capitalize} added to your basket"
    @basket
  end

  def total_amount
    total.inject(0) { |sum, amount| sum + amount }
  end

  def checkout(amount)
    raise "Incorrect amount" unless amount == total_amount
    puts "Thank you for your order! You will receive a confirmation sms shortly."
    @message.send_message
  end

  private
  def total
    @basket.map { |name, quantity| menu.dishes[name] * quantity }
  end

end
