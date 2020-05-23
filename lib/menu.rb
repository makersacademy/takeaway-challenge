class Menu

  attr_reader :menu_list

  def initialize
    @menu_list = {item_number: 1, item: "Nuggets and Chips", price: 3}
  end

  def show_list
    # @menu_list
    "#{@menu_list[:item_number]}. #{@menu_list[:item] }: £#{@menu_list[:price]}"
    # "1. Nuggets and Chips:  £3"
  end
end