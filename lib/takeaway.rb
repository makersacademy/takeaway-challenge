require_relative 'menu'
require_relative 'order_total'
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
    
    order_status_update
    @order << { dish => @menu[dish] }
  end
  
  def show_order(receipt_maker = OrderTotal.new)
    receipt_maker.make_receipt(@order)
  end

  def place_order(texter = TextMessage.new)
    raise "Nothing ordered!" if @order.empty?

    raise "Already ordered!" if @order_placed
    
    @order_placed = true
    texter.sms_send(create_message)
  end

  private

  def available?(item)
    @menu.key?(item)
  end

  def order_status_update
    @order = Array.new if @order_placed
    @order_placed = false
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
