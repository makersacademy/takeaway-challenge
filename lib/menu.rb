class Menu
attr_reader :dishes

  def initailize(dishes)
   @dishes = dishes
  end

  def dishes
  dishes = [
        {name: "Margherita Pizza", price: 8.99},
        {name: "Salami Pizza", price: 9.99},
        {name: "Hawaiian Pizza", price: 9.99},
        {name: "Chips", price: 4.99},
  ]
  end

 def printed_dishes
    dishes.map do |item, price| 
    "%s £" % [item.to_s.capitalize, price]
    end.join(", ")
 end

end