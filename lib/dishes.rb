class Dish

    attr_reader :name, :price

    def initialize(params)
        @name = params[:name] 
        @price = params[:price]
        @available = true
    end
    
end