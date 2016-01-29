class Order

  attr_reader :customer, :menu, :order_details

  def initialize customer, menu, order_details
    @customer = customer
    @menu = menu
    @order_details = order_details
    order_details.each do |item|
      fail "Sorry, we don't serve #{item}. Order aborted." unless menu.keys.include? item
    end
  end

  def calculate_bill
    order_details.map {|i| @menu[i]}.inject(:+)
  end

end
