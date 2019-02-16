class Menu

attr_reader :dishes

    def initialize
      @dishes = [{:dish => "Chicken", :price => "£3.50"},
        {:dish => "Pizza", :price => "£4"}
      ]
    end

    # def print_menu
    #   printed_menu = []
    #   @dishes.each do |dish, price|
    #     puts "#{dish}, #{price}"
    #   end
    # end

    def print_menu
      @dishes.map {|x| x.values.join(" ") }
    end

end
