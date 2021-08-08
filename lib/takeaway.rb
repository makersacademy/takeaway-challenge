require_relative 'menu'
require_relative 'check_total'
require_relative 'text_message'

class Takeaway

  DELIVERY_TIME = 3600

  def initialize(menu = Menu.new.menu)
    @order = Array.new
    @menu = menu
  end

  def view_menu
    make_symbol(hash_to_string(@menu))
  end

  def add(dish)
    raise "Item not available" unless available?(dish)

    @order = Array.new if @order_placed
    @order_placed = false
    @order << { dish => @menu[dish] }
  end

  def current_order
    make_symbol(@order.map { |item| hash_to_string(item) })
  end
  
  def check_total(checker = CheckTotal.new)
    checker.check_total(@order)
    # add an order placed message if order_placed = true
  end

  def place_order(texter = TextMessage.new)
    raise "Nothing ordered!" if current_order.empty?
    
    # need to raise error if order_placed = true

    @order_placed = true
    texter.sms_send(create_message)
  end

  private

  def available?(item)
    @menu.key?(item)
  end

  def hash_to_string(hash)
    hash.map { |dish, price| "#{dish}: #{price}" }
  end

  def make_symbol(input)
    input.join(", ").to_sym
  end

  def create_message(time = Time.now + DELIVERY_TIME)
    "Thank you! Your order was placed and "\
    "will be delivered before #{time.strftime("%k:%M")}"
  end

end
