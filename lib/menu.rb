class Menu
    attr_reader :list_menu, :order, :menu_choice
    def initialize
    @menu_choice = []
    end
    
    MENU_LIST = [ [1, "Pounded Yam", "5.00"],
        [2, "Okra Stew", "7.00"],
        [3, "Bitter Leaf Stew", "8.00"],
        [4, "Yam Porridge with Lamb pieces", "10.00"],
        [5, "Puff Puff", "4.00"],
        [6, "Chin Chin", "3.00"]]

    def list_menu
        puts MENU_LIST.collect {|index| "#{index[0]} #{index[1]} £#{index[2]}"  }
    end

    def create_order
        puts "Please confirm what you would like to order"
        order = STDIN.gets
        @menu_choice << order
    end

    def view_order
        h = @menu_choice.join(",").split
        @k =  h.map { |str| str.to_i }
        @k.each do |i| i
        c = MENU_LIST.assoc(i) 
        puts c.join(" ")
    end

    def confirm_totals
    end

end
end
