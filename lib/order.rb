class Order

  attr_reader :order_detail, :order_total_cost
  attr_accessor :total_check 

  def initialize(options={})
    @order_detail=options.fetch(:order_detail, Object)
    @order_total_cost=options.fetch(:order_total_cost, Object)
  end  

  def self.test_customer_order(customer_order, customer, menu, assistant)
    customer_order.total_check = 0
    customer_order.order_detail.each do |order_item|
      menu.dishes.each do |dish|
        if order_item[:dish]==dish.name
          customer_order.total_check += dish.price*order_item[:item_count]
        end  
      end  
    end
    assistant.take_order(customer_order, customer, customer_order.total_check)
  end 

end 