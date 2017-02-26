require_relative 'menu'
require_relative 'confirmation'

class Order

  attr_reader :selection, :menu, :prices, :total, :orders, :confirmation

  def initialize(menu = Menu.new)
  @menu = menu
  @orders = []
  @selection = {}
  @prices = []
  end

  def start
    puts @menu.introduction
    puts @menu.show_menu
  end

  def select_order(item, amount)
    @selection = { item.to_sym => amount}
    add_to_orders
    return "#{amount} x #{item} added to your order!"
  end

  def add_to_orders
    @orders << @selection
  end

  def get_price
    @orders.each do |order|
    order.each do |item, amount|
    @price = menu.dishes[item]
    puts "#{amount} x #{item.to_sym} at £#{@price} each = £#{@price *= amount}"
    @prices << @price
  end
  end
  end

  def calculate_price
    #puts get_price
    total_price
    puts display_total_price
    puts confirm_alert
  end

  def total_price
    @total = @prices.inject { |accum_value, element| accum_value += element }
  end

  def display_total_price
    raise "Something has gone wrong, please try again" if @total != @prices.inject { |accum_value, element| accum_value += element }
    return "The total cost of your order is £#{@total}"
  end

  def confirm_alert
    "The total order will be scheduled for delivery. Do you wish to continue?"
  end

  private

  #
  # <<<<<< HEAD
  #   def confirm(answer, confirmation = Confirmation.new)
  #     raise "Your order was cancelled" if answer.downcase != "yes"
  #     @confirmation = confirmation
  # ------
  #   def confirm(answer)
  #     raise "Your order was cancelled" if answer.downcase != "yes"
  #     Confirmation.new
  # end

end
