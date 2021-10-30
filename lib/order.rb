require_relative 'menu'
class Order
    attr_reader :order
    def initialize
    @order = []
    @selection = ""
    end


    menu = Menu.new
    p menu

    def select_item
      puts "please make a selection from the menu"
      @selection = "hawian" #gets.chomp
    end

    def add_item
        @order << @selection
    end

    
    


end