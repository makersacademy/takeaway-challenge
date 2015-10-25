require_relative 'twilio'
require_relative 'foods'

class Takeaway
include Twilio
attr_reader :ordered_dishes
ACCOUNT_SID = 'ACc772cdd79988a960ca9fab13e3122a1e'
AUTH_TOKEN = '9094b2c1421543822bd7cf8bcabbe929'
SENDER = '+447481337824'

  def initialize
    @menu_file = 'menu-file.txt'
    @dish_array = []
    @ordered_dishes = Hash.new(0)
    @running_total = 0
    @receiver = '+447527743476'
  end

  def menu
    File.read(menu_file).each_line do |line|
      puts line
    end
  end

  def take_order(total,*dish_klasses)
    price = dish_klasses.inject(0){|sum, k| sum + k.price}
    if total != price
    raise 'The total provided does not match the sum of the prices of the dishes selected'
    end
    @running_total += price
    klass_iterator(dish_klasses)
    review_order
  end

  def review_order
    raise 'No dishes have been ordered' if @dish_array.empty?
    @ordered_dishes = Hash.new(0)
    @dish_array.map{|d| d.class}.each do |c|
      @ordered_dishes[c] +=1
    end
    "Your current order is: #{@ordered_dishes}. The total cost is £#{'%.2f' % @running_total}."
  end

  def submit_order(to = receiver)
    raise 'You have not selected any dishes' if @dish_array.empty?
    remove_order
    send_message(SENDER,to)
    'Thank you. You should now recieve a text confirming your order.'
  end

  def remove_order
    raise 'You have not selected any dishes' if @dish_array.empty?
    @running_total = 0
    @dish_array = []
    "Your order has been removed. Please use the take_order command to select new dishes."
  end

  def subtotal
    "#{'%.2f' % @running_total}"
  end

private
attr_reader :menu_file, :receiver

  def klass_iterator (array)
    array.each do |k|
      @dish_array << k.new
    end
  end

end
