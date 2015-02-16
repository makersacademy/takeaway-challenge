class Order

  attr_reader :order_detail, :order_total_cost

  def self.test_customer_order(order, customer)
    total=0
    order.order_detail.each do |order_item|
      menu.dishes.each do |dish|
        if order_item[:dish]==dish.name
          total += dish.price*order_item[:item_count]
        end  
      end  
    end 
    send_order_to_assistant(self, menu, customer, total)
  end   

  def send_order_to_assistant(order, customer)
    assistant.
  end  

  def initialize(options={})
    @order_detail=options.fetch(:order_detail, Object)
    @order_total_cost=options.fetch(:order_total_cost, Object)
  end 
    
end  