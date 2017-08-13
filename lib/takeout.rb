class Takeout

  attr_reader :basket

  def initialize
    @dishes = Menu.new.dishes
    @basket = []
    @cost = 0
  end

  def add_dish(dish)
    @dishes.select do |key, value|
      @basket << [key, value] if key == dish.to_sym
    end
  end

  def total_price
    total = 0
    @basket.each do |_dish, price|
      total += price
    end
    total
  end

  def current_basket
    arr = []
    @dishes.each do |dish, price|
      @basket.each do |d, p|
      arr << "#{dish.capitalize}: £#{price}" if dish == d
      end
    end
    puts arr
  end

  def read_menu
    @dishes.each do |dish, price|
      puts "#{dish.capitalize}: £#{price}"
    end
  end

  def check_price
    puts "Total price: £#{total_price}"
    "#{current_basket}"
  end

  def place_order
    arr = []
    prompt_for_order
    order = gets.chomp
    calculate_input(order, arr)
    complete_order(arr)
  end

  def checkout(sum)
    raise 'Incorrect sum' unless sum == total_price
    'Success! Your order has been placed'
  end

  private

  def prompt_for_order
    puts "Please place your order!"
    puts "Place quantity first, then food"
    puts "Enter nothing to complete order"
    puts "eg '3, lasagna'"
  end

  def calculate_input(order, arr)
    until order.empty?
      order = order.gsub(/\s+/, "")
      order = order.split(",")
      @cost += ((order[0].to_i)*(@dishes[(order[1].to_sym)]))
      arr << order
      order = gets.chomp
    end
  end

  def complete_order(arr)
    puts "You have ordered:"
    arr.each {|amount, order| puts "#{amount}x #{order}"}
    puts "Your order total price is £#{@cost}"
  end


end