class Menu
    attr_reader :dishes

    def initialize(dishes)
        @dishes = dishes
    end

    def printing
      dishes.map { |name, price|
        "%s £%.2f" % [name.to_s.capitalize, price]
      }.join(", ")  
    end

    def has_dish?(dish)
      !dishes[dish].nil?
    end

end