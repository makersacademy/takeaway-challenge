#require_relative 'takeaway'
class Order
  attr_reader :basket, :total

    def initialize
      @basket = []
      @total = 0
    end

    def add(item, quantity, price)
      store_ordered_items(item, quantity, price)
      return "#{quantity} x #{item}, costing £#{quantity * price} have been added to your order"
    end

    def complete_order
      puts "You ordered: "
      print_each_order
      puts update_total
    end

    def update_total
      @basket.each do |hash|
        @total += hash[:price] * hash[:quantity]
      end
      "Total of £#{@total}"
    end

private
    def store_ordered_items(item, quantity, price)
      @basket << { :dish => item, :quantity => quantity, :price => price }
    end

    def print_each_order
      basket.each { |hash| puts "#{hash[:quantity]} x #{hash[:dish]}. Price: £#{hash[:price] * hash[:quantity]}" }
    end
end
