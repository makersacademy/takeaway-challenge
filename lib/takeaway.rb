require_relative 'cafe'
require_relative 'order'

class Takeaway
  attr_reader :itemised_bill, :basket, :order

  def initialize(order = Order.new)
    @basket = []
    @itemised_bill = []
    @order = order
  end

  def view_menu
    Cafe::ITEMS
  end

  def add(customer_choice)
    Cafe::ITEMS.each { |item| item.each do |key, value|
      if customer_choice == key
        @basket << "#{key}"
        @itemised_bill << value
      end
    end
    }
    return @basket.inject(Hash.new(0)) { |total, x| total[x] += 1; total }
  end

  def total
    @itemised_bill.inject(0, :+)
  end

  def checkout
    @order.send_sms("Your order total is: £#{total}!")
    print "Your order is complete! You will receive a confirmation text. Thank you!"
  end
end
