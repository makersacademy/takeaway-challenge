class Menu

    def select
        @item = item_choice 
    end

    DISHLIST = [:burger, :pizza, :chips]

    def item_choice 
        DISHLIST.sample
    end

end