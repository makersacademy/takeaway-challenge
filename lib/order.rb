require_relative 'menu'
class Order
    attr_reader :order
    
    def initialize
    @order = []
    @selection = ""
    end

    

    def select_item
      puts "please make a selection from the menu"
      @selection = "hawiian" #gets.chomp
    end

    def add_item
        @order << @selection
    end

    #checks customer selection is on menu
    def selection_check
      raise "Sorry your item is not on the menu" unless Menu.new.food.include?(@selection)
      select_item
    end


end