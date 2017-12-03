require_relative 'menu'

class Order
  attr_reader :basket

    def initialize
      @basket = []

    end

    def add(dish, quantity, price)
      ordered_dishes(dish, quantity, price)
      return "#{quantity} x #{dish}, costing £#{quantity * price} have been added to your order"
    end

    def remove(dish, quantity, price)
      delete_dish(dish, quantity, price)
      return "#{quantity} x #{dish}, costing £#{quantity * price} have been deleted from your order"
    end

    def total
      total = 0
      @basket.each do |hash|
        total += hash[:price] * hash[:quantity]
      end
      total
    end

    def complete_order
      puts "You ordered: "
      print_each_order
      puts "Total of £#{total}"
    end

private
    def ordered_dishes(dish, quantity, price)
      @basket << { :dish => dish, :quantity => quantity, :price => price }
    end

    def delete_dish(dish, quantity, price)
      @basket.delete({ :dish => dish, :quantity => quantity, :price => price })
    end

    def print_each_order
      basket.each { |hash| puts "#{hash[:quantity]} x #{hash[:dish]}. Price: £#{hash[:price] * hash[:quantity]}" }
    end
end
