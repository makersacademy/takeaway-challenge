class Takeaway
    attr_reader  :dishes

    def initialize
      @dishes = [{dish: "Pizza", price: 20},
        {dish: "Kebab", price: 12},
        {dish: "Sushi", price: 22},
        {dish: "Burger", price: 10}
      ]
    end

    def see_dishes
        dishes
    end

end
