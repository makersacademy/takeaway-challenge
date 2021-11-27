class Menu
attr_reader :menu_list

    def initialize
        @menu_list = {
            "Eggs Benedict": 8.50, 
            "Full English": 9, 
            "Waffles": 6
        }
    end
end