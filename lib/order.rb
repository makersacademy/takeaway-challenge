
class Order

  attr_reader :the_order

  def initialize
    @the_order = []
  end 

  def add(dish, count = 1)
    count.times do
      @the_order << dish
    end
  end
end

#   attr_reader :order_array

#   def initialize
#     order_array = []
#   end

#   def add_to_order(this_dish)
#     order_array << this_dish


# end

# feedme = Order.new

# p order_array
# p 

# def initialize(orderRequest = Customer.new, )
#   #
# end

# def gather_order 
#   #get order from customer
# end

# def place_order
#   #gather an arrary of hases from the menu 
# end

# def check_total
#   #check that the ord
# end

# def print_order
# end


#   def print_menu
#     puts @items
#     # MAKE THIS LOOP PRETTY LATER
#   end
# end