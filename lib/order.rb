require_relative 'restaurant'
require_relative 'message'

class Order

  attr_reader :list_of_items

  def initialize
    @list_of_items = []
  end

  def add_items(name, price, amount)
    @list_of_items << {name: name, price: price, amount: amount}
  end

  def order_info
    puts "Final price: #{count_final_price}"
    puts "Final number of dishes #{count_dishes}"
  end

  def send_order(total_number)
    fail 'The amount of dishes does not match your order' if total_number != count_dishes
    Message.new
  end

  private

  def count_final_price
    final_price = 0
    @list_of_items.each {|hash|
      final_price += (hash[:price] * hash[:amount])
    }
    return final_price
  end

  def count_dishes
    number_of_dishes = 0
    @list_of_items.each {|hash|
      number_of_dishes += hash[:amount]
    }
    return number_of_dishes
  end

end
