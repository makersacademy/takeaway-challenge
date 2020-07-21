require_relative 'takeaway'
require_relative 'message_sender'
class Order
  attr_reader :order, :takeaway, :order_total
  def initialize
    @order_total = 0
    @order = []
    @takeaway = Takeaway.new
    @send = MessageSender.new
  end

  def show_menu
    @takeaway.show_dishes
  end

  def add(food,quantity)
    @takeaway.dishes.each do |dish, price|
      if dish == food
        quantity.times{@order << [dish, price]}
      end
    end
    return @order
  end

  def show_order
    @order.each do |item|
      @order_total += item[1]
      puts "#{item[0]} - £#{item[1]}"
    end
    puts "\nTotal = £#{@order_total}"
  end

  def checkout
    if @order.empty?
        puts "Your Order is empty!"
      else
        puts "Please your mobile number"
        customer_no = gets.chomp
        puts "Press enter to confirm that #{customer_no} is correct"
        if gets.length >= 2
          customer_no = gets.chomp
        end
        send_delivery_notification(customer_no)
      end
  end

  def send_delivery_notification(customer_no)
    time = Time.now + 1*60*60
    delivery_time = time.strftime("%k:%M")
    message = "Thanks for ordering from Pea's Takeaway.\nYour order is £#{@order_total}\nYour order will be with you before #{delivery_time}"
    notify(customer_no,message)
  end

  def notify(customer_no,message)
    @send.send_message(customer_no,message)
    end
end
