class Menu

    attr_reader :menu_list

    def initialize
        @menu_list = []
    end

    def add_dish(dish)
        @menu_list << dish
    end

    def display_dishes
        menu_id = 1
        @menu_list.each do |item|
            puts "#{menu_id}. #{item.name} - £#{item.price}"
            menu_id += 1
        end
    end
end