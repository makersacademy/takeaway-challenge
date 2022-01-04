class Order
    attr_accessor :order, :total

    def initialize 
      @order = []
      @total = 0
    end
  
    def add(dish)
      @order << dish
      @total += dish.values[0]
      "Total: #{@total}"
    end
  
    def show_order
      @order.each { |dish| puts "#{dish.keys[0]} £#{dish.values[0]}" }
      "Total: #{@total}"
    end
end