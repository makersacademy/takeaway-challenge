require_relative "./menu"
require_relative "./send_sms"
class Order
  ITEM_ERROR = "That item isn't on the menu!".freeze
  ARITHMETIC_ERROR = 'Wow, you broke maths, good job!'.freeze
  DELVERY_MESSAGE = "Thank you! Your order was placed and will be delivered before".freeze

  attr_reader :menu, :my_order, :cheque

  def initialize(menu = Menu.new, message = Message.new)
    @menu = menu
    @my_order = []
    @cheque = 0
    @message = message
  end

  def whole_order(all_the_food)
    all_the_food.each_pair { |menu_item, quantity| quantity.times { order(menu_item) } }
    @message.send(DELVERY_MESSAGE + "#{Time.now + 3600}") if check_cheque?
  end

  private

  def check_cheque?
    check_cheque = 0
    my_order.each { |order| order.each_pair { | _, price| check_cheque += price } }
    check_cheque != @cheque ? raise(ARITHMETIC_ERROR) : true
  end

  def order(food)
    raise ITEM_ERROR unless @menu.menu_items.include?(food)

    place_order(food)
  end

  def place_order(food)
    @cheque += @menu.menu_items[food]
    @my_order << { food => @menu.menu_items[food] }
  end
end
