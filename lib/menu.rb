class Menu
    attr_reader :dishes
    def initialize 
        @dishes = {
            'Flame-roasted toast': 8.50,
            'Sea bass saute': 15.00,
            'Mystery meat sushi': 13.00,
            'Golden egg galette': 11.50,
            'Fire-sauce fillet': 14.00
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
    