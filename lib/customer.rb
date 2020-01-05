class Customer

  attr_reader :current_order

  def initialize(menu = Menu.new, send_sms = SendSMS.new, order = Order.new)
   @menu = menu
   @orders = []
   @orders << order
   @current_order = @orders.last
   @send_sms = send_sms
  end

  def see_menu
    puts @menu.items
  end

  def new_order(order = Order.new)
    @orders << order
    @current_order = @orders.last
  end


  def add_items
    choices = []
    raise "order already submitted" if @current_order.status == "submitted"
    loop do
      puts 'enter number of item or spacebar to finish'
      input = gets.chomp
      break if input == ' '
      @menu.items[input.to_i] != nil ? choices << @menu.items[input.to_i] : (puts "selected item does not exist")
    end
    @current_order.add(choices)
  end

  def order_total
    @current_order.total
  end
  

  def submit_order
    raise "order already submitted" if @current_order.status == "submitted"
    @current_order.submit
    send_text(delivery_message)
  end

  def delivery_message
    time = Time.new
    return "Thank you! Your order was placed and will be delivered before " + (time.hour + 1).to_s + ":" + time.min.to_s
  end

  def send_text(message)
    @send_sms.send(message)
  end
end

