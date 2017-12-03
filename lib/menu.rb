class Menu
    attr_reader :dishes
    def initialize 
        @dishes = {
            'Flame-roasted toast' => 10.00,
            'Sea bass saute' => 15.00,
            'Mystery meat sushi' => 12.50,
            'Golden egg galette' => 12.50,
            'Fire-sauce fillet' => 15.00
                  }
    end
    def view_menu
        menu = ''   
        dishes.map { |food, price| menu += p"#{food}: £#{price}" }
        menu
    end
    def dish_search
        menu = ''
        dishes.map.each { |food, price| menu += "#{food}: £#{price} " }
        menu
    end
end
    