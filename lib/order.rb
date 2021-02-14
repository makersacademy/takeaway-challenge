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

  def add_item(item)
    order_closed_error
    @dishes << @menu.pick(item)
    @balance += @dishes.last[:price]
    @balance.round(2)
  end

  def total
    print_money(@balance)
  end

  def check_balance
    puts list_dishes
    sum = @dishes.map { |dish| dish[:price] }.inject(0, :+)
    puts "Total: " + print_money(sum)
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
    @message = "Thank you! Your order for:\n" +
    list_dishes +
    "\nat a total of #{total} has been placed and will be delivered when we feel like it."
  end

end
