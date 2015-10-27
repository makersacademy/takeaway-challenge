require_relative 'twilio'
require_relative 'menu'
require 'dotenv'
Dotenv.load

class Takeaway
include Twilio
attr_reader :ordered_dishes
SENDER = ENV['SENDER']

  def initialize(menu_klass=Menu.new)
    @menu_file = 'menu-file.txt'
    @menu_klass = menu_klass
    @ordered_dishes = Hash.new(0)
    @running_total = 0
    @receiver = ENV['RECEIVER']
  end

  def menu
    File.read(menu_file).each_line do |line|
      puts line
    end
  end

  def take_order(total,*dishes)
    raise 'The total provided does not match the sum of the prices of the dishes selected' if total != dish_prices(dishes)
    @running_total += dish_prices(dishes)
    create_order_hash(dishes)
    review_order
  end

  def review_order
    raise 'No dishes have been ordered' if @ordered_dishes.empty?
    "Your current order is: #{@ordered_dishes}. The total cost is £#{'%.2f' % @running_total}."
  end

  def submit_order(to = receiver)
    raise 'You have not selected any dishes' if @ordered_dishes.empty?
    remove_order
    send_message(SENDER,to)
    'Thank you. You should now recieve a text confirming your order.'
  end

  def remove_order
    raise 'You have not selected any dishes' if @ordered_dishes.empty?
    @running_total = 0
    @ordered_dishes = Hash.new(0)
    "Your order has been removed. Please use the take_order command to select new dishes."
  end

  def subtotal
    "#{'%.2f' % @running_total}"
  end

private
attr_reader :menu_file, :receiver, :menu_klass

  def create_order_hash (array)
    array.each do |k|
      @ordered_dishes[k] +=1
    end
    @ordered_dishes
  end

  def dish_prices(dish_array)
    dish_array.inject(0){|sum, k| sum + menu_klass.access[k]}
  end

end
