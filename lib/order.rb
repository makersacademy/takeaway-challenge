class Order

  attr_reader :dishes, :menu

    def initialize(menu)
      @dishes = {}
      @menu = menu
    end

    def add(title, quantity)
      fail "#{title.upcase} is not on the menu!!" unless menu.in_menu?(title)
      dishes[title] = quantity
    end

    def total
      dishes.map { |title, quantity| menu.price(title) * quantity }.inject(:+)
    end

end
