class Pub
  def initialize(order)
    @order = order
  end

  def read_and_make
    puts "This is what we need to make now:"
    @order.items.each { |order_item|
      puts "We need to make #{order_item[:name]} x #{order_item[:amount]} "
    }
  end
end
