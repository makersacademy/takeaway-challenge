class Dish
    def initialize(name, price)
      @name = name
      @price = price
    end
  
    def view
      {@name => @price}
    end
end
