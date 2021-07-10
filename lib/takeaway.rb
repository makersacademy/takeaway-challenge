class Takeaway
attr_reader :menu
    def initialize        
        @menu = [{item: 'chicken', price: 4}, 
            {item: 'beef', price: 6}, 
            {item: 'pork', price: 5}, 
            {item: 'vegetable', price: 3}]
    end

    def view_menu
        return @menu
    end

end