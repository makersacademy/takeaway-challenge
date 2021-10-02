class Menu
    def initialize(item = select)
        @item = item
    end

    def select
        DISHLIST.sample
    end

    def print_item
        @item
    end

    DISHLIST = [:burger, :pizza, :chips]

   

end