class Customer

  attr_accessor :name, :number, :klass

  DEFAULT_CUSTOMER_ORDER = {:order_detail => [{ :dish=>"", 
                                                :item_count=>0 }], 
                            :order_total_cost=>0 }

  def initialize(options={})
    @name=options.fetch(:name, "")
    @number=options.fetch(:number, "")
    @klass=options.fetch(:klass, Object)
    @customer_order=DEFAULT_CUSTOMER_ORDER
  end  

  def place_order(menu, assistant)
    #requires user input
    customer_order=klass.new({:order_detail => [{:dish => :pizza, :item_count => 3}, 
                                                {:dish => :burger, :item_count => 3}],
                              :order_total_cost => 210})
    klass.test_customer_order(customer_order, self, menu, assistant)
  end  
 
end