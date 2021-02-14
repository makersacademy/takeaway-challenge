require_relative 'script'
require_relative 'menu'
require_relative 'dish_lister'
require_relative 'twilio_adapter'

class Order
  include DishLister

  attr_reader :menu, :dishes, :complete, :balance
  def initialize(menu, twilio_adapter, customer_number)
    @twilio_adapter = twilio_adapter
    @customer_number = customer_number
    @menu = menu
    @dishes = []
    @balance = 0
    @complete = false
  end

  def add_items(*args)
    order_closed_error
    new_dishes = args.map { |item| @menu.pick(item) }
    add_dishes(new_dishes)
    @balance += new_dishes.map { |dish| dish.price }.inject(0, :+).round(2)
  end

  def total
    print_money(@balance)
  end

  def check_balance
    puts list_dishes
    puts "Total: " + print_money(@balance)
  end

  def finalize
    complete_order
    @twilio_adapter.send_message(@customer_number, @message)
  end

private

  def order_closed_error
    fail "this order is closed" if @complete == true
  end

  def complete_order
    @complete = true
    @message = "Thank you! Your order from #{@menu.title} for:\n" +
    list_dishes +
    "\nat a total of #{total} has been placed and will be delivered as soon as possible."
  end

end
