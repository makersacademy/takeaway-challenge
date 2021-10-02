class TakeAway

    def initialize
        
    end 

    def select
        item_choice
    end

    def see_dishes
        DISHLIST
    end

    DISHLIST = [:burger, :pizza, :chips]

    def item_choice 
        DISHLIST.sample
    end

end 