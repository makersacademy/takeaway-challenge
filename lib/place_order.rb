require_relative 'order'
require_relative 'menu'

class PlaceOrder

  def initialize(order_class=Order, menu=Menu.new)
    @order_class = order_class
    @current_order = nil
    @menu = menu
  end



  def process
    order_items = {}
    user_input = collect_order
    order_items[user_input[0].to_sym] = user_input[1].to_f
    while more_order? do
      user_input = collect_order
      order_items[user_input[0].to_sym] = user_input[1].to_f
    end
    @current_order = create_order(order_items)
    puts 'OK. Enter the total price of your order.'
    user_input = gets.chomp.to_f
    raise 'Total price does not match' if @current_order.total_price(@menu) != user_input
    @current_order.send_txt_confirm
  end


#-------------------- private
  def collect_order
    puts 'Enter your order [<dish name>,<quantity>]'
    user_input = gets.chomp.split(',')
  end

  def more_order?
    puts 'Add something else? [y/n]'
    user_input = gets.chomp
    (user_input == 'y')? true : false
  end

  def create_order(order_items)
    @current_order = @order_class.new(Time.now, order_items)
  end


end
