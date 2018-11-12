require './lib/send_message'
# include Send_message

class Order
  attr_reader :total

  def initialize
    @total = 0
  end  

  def process(basket)
    # basket.total == 
    # by giving the list of dishes, their quantities and a
    #  number that should be the exact total. If the sum is not 
    #  correct the method should raise an error, otherwise the 
    #  customer is sent a text saying that the order was placed 
    #  successfully and that it will be delivered 1 hour from now, 
    #  e.g. "Thank you! Your order was placed and will be delivered
    #   before 18:52".
    
  end

#   def assure_totals(basket)
#     basket.each do |item|
#       if item.has_value?(select.capitalize)
#         item[:quantity] = val
#         basket.add(dish)
#       end
#     end
#   end

  def success?

  end

end
