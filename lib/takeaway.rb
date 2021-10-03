
class Takeaway
  attr_reader :order

  def initialize(menu, order_class = Order)
    @order_class = order_class
    @order = @order_class.new
    @menu = menu
  end
  
  def see_menu
    n = 1
    @menu.items.each do |dish| 
      puts "#{n} - #{dish.name}, £#{dish.price}"
      n += 1
    end
  end

  def add_to_order(n)
    puts "Sorry, I didn't understand" && serve_customer unless valid_order_input(n)
    @order.items << @menu.items[n.to_i - 1]
    puts "#{@menu.items[n.to_i - 1].name} added to the order"
  end

  def check_total
    puts "Your order is: "
    @order.items.map { |dish| puts "- #{dish.name}, £#{dish.price}" }
    puts "Total cost: £#{@order.items.reduce(0) { |sum, item| sum + item.price }}"
  end

  def place_order
    @order.send_confirmation
    @order = @order_class.new
    puts "Thanks, you should receive a text confirmation, feel free to start another order"
  end

  def serve_customer
    loop do
      puts "Please enter the number of the option you would like to select from the following: "
      print_options
      interface(STDIN.gets.chomp)
    end
  end

  def valid_order_input(input)
    input.match(/^(\d)+$/) && input.to_i.between?(1, @menu.items.count + 1)
  end

  def print_options 
    puts "1. See menu"
    puts "2. Add item to order"
    puts "3. Check order total"
    puts "4. Place order"
    puts "5. Exit"
  end

  private

  def interface(i)
    case i
      when '1'
        see_menu
      when '2'
        puts "Please enter the number of the dish you would like to add: "
        add_to_order(STDIN.gets.chomp)
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
