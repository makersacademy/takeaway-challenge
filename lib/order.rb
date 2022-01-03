class Order 
attr_accessor :order_list
  
  def initialize
    @order_list = []
    @list = Menu.new.list
  end 

  def add(item)
    @order_list << { item => @list[item] }
  end 

  def total
    @order_list.inject(0){|sum, hash| sum+= hash.values.join.to_i}
    #find the right way to add hash values in arrayz``
  end 

end 