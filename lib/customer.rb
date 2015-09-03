require_relative 'order'
require_relative 'menu'
require_relative 'twilio'

class Customer
  attr_accessor :name, :phone_number, :order, :selection, :price, :total
  def initialize(order = Order.new)
    @name
    @phone_number
    @order = order
    @selection
    @quantity
    @price
    @total
  end

  def place_order
    get_name
    @order.select_dishes(@selection, @price, @quantity)
    get_total
  end

  def get_name
    puts "Good evening, can I get your name please?"
    @name = gets.chomp
    get_phone
  end

  def get_phone
    puts "and what is your phone number, for delivery verification?"
    @phone_number = gets.chomp.to_i
    see_menu
  end

  def see_menu
    self.order.menu.display.each { |k,v| puts "#{k}:#{v}" }
    get_food
  end

  def get_food
    puts "What will you be having today?"
    @selection = gets.chomp.downcase
    raise "That dish is not on the menu!" if @order.menu.display.has_key?(@selection) == false
    get_quantity
  end

  def get_quantity
    puts "how many #{@selection}'s would you like?"
    @quantity = gets.chomp.to_i
    get_price
  end

  def get_price
    @price = @order.menu.display[selection]
  end

  def get_total
    @total = @order.total_cost
    puts "Your total is $#{total}. Please confirm (y or n)"
    confirmation = gets.chomp
    get_confirmation(confirmation)
  end

  def get_confirmation(input)
    if input  == "y"
      puts "Order up! You will receive a text confirmation."
      send_text(@name, @phone_number)
    else
      puts "Deleting order, try again."
      @order.delete_order
    end
  end

end
