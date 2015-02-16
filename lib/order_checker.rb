module OrderChecker

  def self.included base
    # base.send :include, InstanceMethods
    base.extend ClassMethods
  end
  
  module ClassMethods
    def test_customer_order(customer, order, assistant)
      total_check=0
      order.order_detail.each do |order_item|
        Menu.dishes.each do |dish|
          if order_item[:dish]==dish.name
            total_check += dish.price*order_item[:item_count]
          end  
        end  
      end
      if total_check==order.order_total_cost
        order.confirm_order(customer, assistant)
      else
        raise "Sorry you inputted the wrong total cost, please try again."
      end  
    end 
  end  

end  