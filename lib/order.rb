class Order
  attr_reader :order 
  
  ERROR_NOT_INTEGER = "Error: only numbers can be supplied"
  
  def initialize 
    @order = Array.new 
  end
  
  def add(number, menu)
    raise ERROR_NOT_INTEGER unless number.is_a?(Integer)

    # TODO: pass error raised by menu.get(number) and raise it again?
#     begin
#       menu.get(number)
#     rescue 
#       raise Menu::ERROR_DISH_NOT_EXISTS
#     end

    menu.get(number)
    
    @order.push(number)
    @order.last
  end
  
end
