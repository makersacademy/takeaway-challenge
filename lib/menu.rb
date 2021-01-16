class Menu
    def initialize
        @dishes = []
    end

    def add(dish)
        @dishes << dish
    end

    def list
        @dishes.each { |dish| puts "#{dish.name} - £#{dish.price}" }
    end
end