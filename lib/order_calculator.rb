require_relative "menu"
class Calculator



def calculate
  @order.each {|item| @total_price = item[:quantity]*item[:cost]}
end


end
