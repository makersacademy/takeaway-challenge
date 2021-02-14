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
    @dishes += args.map { |item| @menu.pick(item) }
    @balance += get_balance(args)
    @balance.round(2)
  end

  def total
    print_money(@balance)
  end

  def check_balance
    puts list_dishes
    puts "Total: " + print_money(get_balance(@dishes))
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
    "\nat a total of #{total} has been placed and will be delivered the very second lockdown ends."
  end

  def get_balance(dishes)
    dishes.map { |dish| dish.price }.inject(0, :+)
  end

end
