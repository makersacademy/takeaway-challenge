 class Menu

attr_reader :dishes

   def initialize(dishes)
    @dishes = dishes
   end
   
   def print_out
   dishes.map do |title, price|
    "%s £%.2f" % [title.to_s, price] #use a map method to go through array, turn into string
    end.join(", ") #join array to get string
end
   
    def has_dish?(dish)
      !dishes[dish].nil?
    end

    def price(dish)
     dishes[dish]
    end

 end
