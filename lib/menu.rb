class Menu

attr_reader :menu

  def initialize(menu = {:pizza => 6.00, :burger => 7.00, :katsuwrap => 4.50, :curry => 5.50})
    @menu = menu
  end

    def display_menu
    @menu
    end

    def contains_dish?(dish)
    @menu.has_key?(dish.to_sym)
  end
end
