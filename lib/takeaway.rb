require_relative 'cafe'
require_relative 'complete'

class Takeaway
  attr_reader :menu, :basket, :price

  def initialize
    @basket = []
    @itemised_bill = []
    @complete = Complete.new
    puts "Hi! May I take your order?"
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
    @complete.send_sms("This is the voice of your conscience speaking - your order total is: £#{total}!")
    print "Your order is complete! You will receive a confirmation text. Thank you!"
  end
end
