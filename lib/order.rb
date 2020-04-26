class Order
  attr_reader :current_items

  def initialize 
    @current_items = { }
  end 

  def add_item(item, quantity)
    if @current_items[item.to_sym] == nil
      @current_items[item.to_sym] = []
    end 
    @current_items[item.to_sym] << quantity
  end 
end 