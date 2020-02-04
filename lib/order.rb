require_relative "takeaway"
require_relative "message"

class Order
  attr_reader :basket, :menu, :total

  def initialize
    @basket = Hash.new(0)
    @total = 0
    @menu = Takeaway.new.menu_list
  end

  def make_order
    loop do
      puts "Here is the menu: #{@menu}"
      puts "What would you like to order? "
      selection = gets.chomp
        if selection.empty?
          order_summary
          confirm
          break
        elsif selection == "quit"
          break
        else 
          puts "How many would you like to order? "
          quantity = gets.chomp.to_i
          add_item(selection, quantity)
        end  
    end
  end

  def add_item(item, quantity)
    @menu.each do |k, v|
      if item == k
        @basket[item] += quantity
        @total += (v * quantity)
        order_summary
      end
    end
  end

  def order_summary
    @basket.each do |dish, quantity|
      puts "#{quantity} x #{dish}" 
    end
    puts "Coming to a total of: £#{@total}"
  end

  def confirm
    puts "Would you like to confirm order?(Y/N) "
    confirmation = gets.chomp
    if confirmation == "Y"
      send_confirmation
    end
  end

  def send_confirmation
    time = Time.new.+(1800).strftime("%I:%M %p")
    message = Message.new
    message.send("Thank you! Your order was placed and will be delivered before #{time}")
  end

  def verify
    dish_sum = 0
    @menu.each do |k, v|
      @basket.each do |dish, quantity|
        if k == dish
          dish_sum += (v * quantity)
        end
      end
    end
    
    if dish_sum == @total
      return "Your order total matches the sum of dishes"
    else
      return "Your order total does not match the sum of dishes"
    end
  end
end
