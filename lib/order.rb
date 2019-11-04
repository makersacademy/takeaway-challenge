require_relative 'send-sms'

class Order

  attr_reader :basket

  def initialize(sms = SMS.new)
    @basket = []
    @sms = sms
  end

  def add_to_basket(dish, price, quantity)
    @selection = {}
    @selection[:dish] = dish
    @selection[:price] = price
    quantity.times { @basket << @selection }
    selection_confirmation(dish, quantity)
  end

  def selection_confirmation(dish, quantity)
    selection_price = '%.2f' % (quantity * @selection[:price])
    "#{quantity} x #{dish} added to your basket.\n
That will be £#{selection_price}.\n
Anything else?"
  end

  def calculate_total
    @total = 0
    @basket.each do |selection|
      @total += selection[:price]
    end
    @total = '%.2f' % @total
  end

  def confirm_total(amount)
    calculate_total
    raise "The correct total is: £#{@total}." if @total != ('%.2f' % amount)
    @sms.send_message
  end

end
