class Order

  attr_reader :customer, :menu, :order_details

  def initialize customer, menu, order_details
    @customer = customer
    @menu = menu
    @order_details = order_details
    @items = []
    order_details.each do |i|
      @items << i unless menu.keys.include? i
    end
    fail "Sorry, we don't serve: #{@items.join(', ')}. Order aborted." unless @items.empty?
  end

  def calculate_bill
    order_details.map {|i| @menu[i]}.inject(:+)
  end

end
