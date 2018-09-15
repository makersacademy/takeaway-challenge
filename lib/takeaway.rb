require_relative 'menu'
#require_relative 'sms'
class Takeaway

attr_reader :customer_order, :total, :sms
@menu = []

  def initialize(menu = Menu.new, sms = Sms.new)
    @customer_order = []
    @menu = menu
    @total = 0.0
    @sms = sms
  end

  def show_menu
    @menu.show_menu
  end

  def ready_to_order
    @customer_order = @menu.select_dishes
    verify_order(@customer_order)
  end

  def verify_order(order)
    @total = order.map { |item| item[:price] * item[:quantity]}.reduce(:+)
    order.each do |item|
      item.each do |value|
        print "#{value}"
      end
      puts
    end
    puts
    puts "your total is #{@total} "
    if @total == order.map { |item| item[:price] * item[:quantity]}.reduce(:+)
      'send sms to the customer'
    else
      'Sum does not match the total sum of the dishes ordered.'
    end
    #{}"You have ordered #{order[:dish]} #{order[:price]} #{order[:quantity]} and your total is #{@total}"
  end



  end
