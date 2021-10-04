class Menu
attr_reader :dishes

  def initailize(dishes)
   @dishes = dishes
  end

#   def dishes
#   dishes = 
#         {
#               "Margherita Pizza": 8.99},
#       #   {name: "Salami Pizza", price: 9.99},
#       #   {name: "Hawaiian Pizza", price: 9.99},
#       #   {name: "Chips", price: 4.99},
#   }
#   end

  def print_dishes
    dishes.map do |title, price| 
       [title.to_s.capitalize, price]
    end.join(", ")
  end
 



end