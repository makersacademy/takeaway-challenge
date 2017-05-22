require 'dotenv/load'
Dotenv.load('settings.env')
require_relative 'notifier'
require_relative 'menu'
require_relative 'order'

class Restaurant

  attr_reader :name, :address, :menu, :orders

  def initialize(name, address, menu = Menu.new, notifier = Notifier.new)
    @name      = name
    @address   = address
    @notifier  = notifier
    @menu      = menu
    @orders    = []
    @order_ids = []
  end
 
  def create_customer_order(order_id = generate_order_id)
    @current_order = Order.new(order_id, @menu)
    @orders << @current_order
  end

  def add_items_to_order(order_id, dish, quantity = 1)
    get_order_details(order_id)
    @current_order.add_dish(dish, quantity)
  end

  def finalize_customer_order(order_id)
    get_order_details(order_id)
    @current_order.finalize
    @orders << @current_order
  end

  def accept_customer_order(order_id)
    @current_order = get_order_details(order_id)
    @current_order.accepted
    @notifier.send_message("Order #{order_id} was confirmed.
    The total amount is £#{@current_order.total} 
    and it will be delivered by #{delivery_time}")
  end

  def order_list
    @orders.each do |order|
      puts "ORDER: #{order.id}"
      puts "Status: #{order.status.capitalize}"
      puts "Items:"
      order.items.each do |order_details|
        puts "#{order_details[:name]} Qty: #{order_details[:quantity]} Price: £#{order_details[:price]}"
      end
      puts
      puts "Order Total: £#{order.total}"
      puts
    end
  end
  
  private

  def get_order_details(order_id)
    @orders.each do |order|
      return @current_order = order if order_id == order.id
    end
    raise "Invalid order"
  end

  def delivery_time
    time = Time.now + 2700
    time.strftime("%H:%M")
  end

  def generate_order_id(size = 6)
    charset = %w{2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    order_id = (0...size).map { charset.to_a[rand(charset.size)] }.join
    if @order_ids.include? "order_id"
      generate_order_id
    else 
      @order_ids << order_id
      order_id
    end
  end

end
