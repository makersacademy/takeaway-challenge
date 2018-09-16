require_relative 'menu'
require_relative 'sms'

class Takeaway
  attr_reader :customer_order, :total, :sms
  @menu = []

  def initialize(menu = Menu.new, sms_obj)
    @customer_order = []
    @menu = menu
    @total = 0.0
    @sms = sms_obj || Sms.new
  end

  def show_menu
    @menu.show_menu
  end

  def ready_to_order
    @customer_order = @menu.select_dishes
    verify_order(@customer_order)
  end

  def verify_order(order)
    @total = order.map { |item| item[:price] * item[:quantity] }.reduce(:+)
    order.each do |item|
      item.each do |value|
        print "#{value}"
      end
      puts
    end
    complete_order(@total)
  end

  def complete_order(total)
    "your total is #{total} "
    if is_price_correct?
      #'send sms to the customer'
       @sms.send_message("Thank you for your order, it will be delivered before 18:55")
    else
      'Sum does not match the total sum of the dishes ordered.'
    end
  end

  private
  def is_price_correct?
    rand(0..9) > 7
  end

end

#
