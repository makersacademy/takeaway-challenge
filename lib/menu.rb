class Menu

attr_reader :print_menu, :todays_menu

    def initialize
      @print_menu = []
      @todays_menu = []
    end

    def todays_menu
      @todays_menu = [{:pizza => :Margherite, :price => 1.25},
                      {:pizza => :Pepperoni, :price => 1.75},
                      {:pizza => :Spicy, :price => 2.75}]
                   end

    def print_menu

      #puts "#{todays_menu}"

      puts todays_menu.collect { |p| "#{p[:pizza]} pizza, Price £#{p[:price]}"}

    end


end
