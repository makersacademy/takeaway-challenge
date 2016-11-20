class Order
attr_accessor :list_of_dishes, :menu

  def initialize
    @list_of_dishes = []
  end

  def select_dish(choice, how_many)
    while how_many != 0
      @list_of_dishes << "#{choice}: #{menu[choice.to_sym]}"
      how_many -= 1
    end
    @list_of_dishes
  end

  def menu
    @menu = {
      cheeseburger: "8.50",
      fries: "3.75"
    }
  end

  def print_menu
    printed_menu = menu.map { |dish, price| "#{dish}: £#{price}" }
    printed_menu.each { |dish_with_price| puts dish_with_price }
  end

  def verify_order(total_cost)
    menu_list = @list_of_dishes.map { |menu_item| menu_item.to_s.split(" ") }
    price_list = menu_list.map { |item_and_price| item_and_price[1].to_f }
    real_cost = price_list.inject(0) { |sum, x| sum + x }
    if real_cost != total_cost.to_f
      false
    else
      true
    end
  end


end
