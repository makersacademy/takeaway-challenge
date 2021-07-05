require_relative 'dish'

class Menu
    attr_reader :options, :list
  
    def initialize
      @options = []
    end
  
    def add(dish)
      fail "#{dish.name} is already on the menu" if contains?(dish)
      
      @options << dish
      "#{dish.name} has been added to the menu"
    end
  
    def list
      @options.map { |dish| "#{dish.name} £#{dish.price}" }.join(", \n ")
    end
  
    def contains?(dish)
      @options.include? dish
    end
end

