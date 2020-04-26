class Order
  attr_reader :current_items

  def initialize 
    @current_items = { }
  end 

  def add_item(configured, quantity)
    if @current_items[configured.to_sym] == nil
      @current_items[configured.to_sym] = []
    end 
    @current_items[configured.to_sym] << quantity
  end 
end 