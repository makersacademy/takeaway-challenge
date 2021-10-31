class Order
    DEFAULT_MAXIMUM = 5
  
    attr_accessor :orders, :count, :total
  
    def initialize(options = {})
      @maximum_order = options.fetch(:maximum_order, maximum_order)
      @orders = {}
      @count = 0
      @total = 0
    end
  
    def maximum_order
      @maximum_order ||= DEFAULT_MAXIMUM
    end
  
    def add_dish(dish, amount)
      @orders[dish] = amount
    end
  
    def display_current_order
      @orders
    end
  
    def item_count
      orders.each { |dish, amount| @count += amount }
      @count
    end
  
    def order_total
      orders.each { |dish, amount| @total += (dish.price * amount) }
      @total
    end
  end