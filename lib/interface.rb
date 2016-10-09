class Interface

  attr_reader :menu_array, :order

  def initialize(filepath)
    @menu = Menu.new(filepath)
    @order = Order.new
    @order_array = []
    @menu.build_menu_display
  end

  def user_interaction
    welcome
    build_order(@menu, @order)
    show_order
    order_confirm
  end

  def welcome
    file_reader('/Users/malinnaleach/Programs/takeaway-challenge/lib/welcome.txt')
    display(@menu.menu_array)
  end

  def file_reader(filepath)
    File.open(filepath) {|f| puts f.read}
  end

  def display(array)
    array.each {|string| puts string}
  end

  private

  def build_order(menu, order)
    loop do
      input_request
      input = user_input
      break if input.empty?
      dish = menu.dishes[input.to_i - 1]
      quantity_request(dish.name)
      quantity = quantity_input
      order.add(create_order_line(dish, quantity))
    end
  end

  def input_request
    file_reader('/Users/malinnaleach/Programs/takeaway-challenge/lib/input_request.txt')
    print ">> "
  end

  def quantity_request(dish)
    puts "Please enter the quantity of #{dish} you would like"
    print ">> "
  end

  def show_order
    puts "\nOrder summary:"
    display(@order.order_display)
    puts "\nTotal number of dishes:  #{@order.dish_qty}"
    puts "Total cost of your order:  £#{'%.2f' % [@order.total_cost]}"
  end

  def order_confirm
    loop do
      puts "\nPlease input 'OK' to proceed or 'end' to cancel"
      print ">> "
      input = gets.chomp
      if input == "OK"
        puts "\nThank you for your order.  Text confirmation has been sent."
        puts
        send_text
        break
      elsif input == "end"
        puts "No worries, please come again.\n"
        exit
      end
    end
  end

  def send_text
    Texter.new
  end

  def user_input
    gets.chomp
  end

  def quantity_input
    user_input.to_i
  end

  def create_order_line(dish, quantity)
    OrderLine.new(dish, quantity)
  end

end
