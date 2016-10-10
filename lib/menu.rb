class Menu
  attr_reader :dishes

    def initialize(dishes)
      @dishes = dishes
    end

    def print
      dishes.map do |title, price|
        "%s £%.2f" % [title.to_s.capitalize, price]
      end.join(", ")
    end



  # def menu
  #   { "1 Egg" => 1.00,
  #     "2 Eggs" => 2.00,
  #     "3 Eggs" => 3.00,
  #     "4 Eggs" => 4.00,
  #     "5 Eggs" => 5.00}
  # end
  #

end
