require_relative 'menu.rb'

# This new class is going to create an order
class Order

  attr_reader :dishes

  def initialize
    @dishes = []
    @menu = Menu.new
    @complete = false
  end

  def add_dish(name, amount = 1)
    @name = name
    @amount = amount
    fail "This dish isn't available, please run menu.list_dishes to see the dishes" unless available

    @dishes << { :name => name, :amount => amount }
  end

  def available
    @menu.list_dishes.any? { |hash| hash[:name] == @name }
  end

  def total_price
    @dishes.map { |dish|
      @menu.price(dish[:name]) * dish[:amount]
    }.sum 
  end

  def complete
    puts "Your total order today is £#{total_price}"
    @complete = true
    message
  end

  def message
    raise "Sorry your order isn't complete" unless @complete == true
    
    current_time = Time.new
    one_hour_later = current_time + 3600
    "Thank you for your order! The delivery should arrive in one hour at 
    #{one_hour_later.strftime("%I:%M%p")} "
  end
end
