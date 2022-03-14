class Menu

    attr_reader :dishes
    def initialize(dishes)
        @dishes = []
        dishes.each do |dish|
            @dishes << dish
        end
        # @dishes = dishes
    end

    def list
        menu = ""
        @dishes.each do |dish|
            line = "#{dish.name}: #{dish.price}\n"
            menu += line
        end
        return menu.strip()
    end

    def exists(other_dish)
        @dishes.each do |dish|
            if dish.name == other_dish.name
                return true
            end
        end
        return false
    end

end