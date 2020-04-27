class Order
  attr_reader :order_array

  def initialize
    @order_array = []
    @sum = 0
  end

  def order(order_total, menu, basket)
    basket.each do |dish, quantity|
      menu.each do |hash|
        quantity.times { @order_array << hash } if hash.key?(dish)
      end
    end
    verify(order_total)
  end

  def verify(order_total)
    @order_array.each do |order_item|
      order_item.each do |_dish, value|
        @sum += value
      end
    end
    total_error if @sum != order_total

    send_text if @sum == order_total
  end

  def send_text
    require './lib/send_sms.rb'
  end

  private

  def total_error
    raise "Error: The total given does not equal the menu total"
  end
end
