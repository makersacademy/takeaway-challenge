class Takeaway
  attr_reader :order

  def initialize(menu, order_class = Order)
    @order = order_class.new
    @menu = menu
  end
  
  def see_menu
    n = 1
    @menu.items.each do |dish| 
      puts "#{n} - #{dish.name}, £#{dish.price}"
      n += 1
    end
  end

  def add_to_order
    puts "Please enter the number of the dish you would like to add "
    n = gets.chomp
    @order.items << @menu.items[n.to_i + 1]
    puts "#{@menu.items[n.to_i + 1].name} added to the order"
  end

  def check_total
    total = @order.items.reduce { |sum, item| sum + item }
    puts "Your order is #{@order.items} and the total is: £#{total}"
  end

  def place_order
    #OrderConfirmation.send_sms
  end

  def interaction
    puts "Welcome to the takeaway, please select from the following options"
    loop do
      print_options
      interface(STDIN.gets.chomp)
    end
  end



  private

  def print_options 
    puts "1. See menu"
    puts "2. Add item to order"
    puts "3. Check order total"
    puts "4. Place order"
    puts "5. exit"
  end

  def interface(i)
    case i
      when '1'
        see_menu
      when '2'
        add_to_order
      when '3'
        check_total
      when '4'
        place_order
      when '5'
        exit
      else 
        puts 'Please enter a valid menu option'
    end
  end
end