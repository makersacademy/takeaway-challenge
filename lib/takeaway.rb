class Takeaway
  attr_accessor :order
  attr_reader :menu
  def initialize
    @menu = {
      "beans and toast" => 6,
      "baked eggs" => 7.75,
      "english breakfast" => 9,
      "BLT sandwich" => 5,
      "smoked salmon sandwich" => 5 }
    show_menu
    place_order
    puts "This is what you have ordered: \n"
    dishes_list
    puts "This is the total price for your order £#{total}"
  end

  def show_menu
    menu_text =
      "
      1. beans and toast        6\n
      2. baked eggs             7.75\n
      3. english breakfast      9\n
      4. BLT sandwich           5\n
      5. smoked salmon sandwich  5


      "
    print "#{menu_text}"
    # file = File.open("lib/menu_text", "r")
    # data = file.read
    # file.close
    # data
  end

  def place_order
    customer_selection = ARGV.first
    prompt = '>'
    puts "Please, place your order", prompt
    @order = ($stdin.gets.chomp).split(',').map(&:to_i)
  end

  def dishes_list
    @order.each { |index| puts "#{@menu.keys[index - 1]}" }
  end

  def total
    order_prices = []
    @order.each { |index| order_prices << @menu.values[index - 1] }
    total = order_prices.inject(:+)
  end
end

