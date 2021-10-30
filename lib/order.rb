require_relative 'menu'
class Order
    attr_reader :order
    
    def initialize
    @order = []
    @selection = ""
    @quantity = 0
    end

    def select_item
      puts "please make a selection from the menu"
      @selection = "hawiian" #gets.chomp
    end

    def select_quantity
      puts "Please choose a quantity"
      @quantity = 2 #gets.chomp
    end

    #checks customer selection is on menu
    def selection_check
        raise "Sorry your item is not on the menu" unless Menu.new.food.include?(@selection)
    end

    def add_item
        @quantity.times do
        @order << @selection
        end
    end

    


end