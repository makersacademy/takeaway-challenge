class Takeout

  def initialize
    @menu = Menu.new
    @order = Order.new
    @message = Message.new
    @delivery = Delivery.new
  end

  def build
    item = ' str '
    while item.downcase != 'end'
      puts 'Enter item or type end to confirm'
      item = gets.chomp!
      return if item.downcase == 'end'
      puts 'Enter number of items'
      number = gets.chomp!
      @order.add(item, number.to_f, @menu)
    end

  end

  def confirm
    puts @order.order
    puts @order.total
    puts 'Please type Yes confirm order and price or No to cancel'
    confirm = gets.chomp!
      if confirm.downcase == 'yes'
        delivery
      else
        puts "Order cancelled"
        @order = Order.new
      end

  end

  def delivery
    puts 'We will send you a text message to confirm delivery time'
    puts 'Please enter phone number'
    number = gets.chomp!
    p = 'test'
    delivery_time = @delivery.time
    message_text = "Your order will be delivered at #{delivery_time}."
    @message.send(number, message_text)
    puts 'Message sent'
  end

  def list_menu
    puts 'Here is our menu'
    puts @menu.list # assume this would be formatted for display
  end

end

t = Takeout.new
puts 'Welcome to The Ruby Gem Odd Menu Takaway'
t.list_menu
puts 'Build your order'
t.build
puts 'Please confirm your order'
t.confirm
