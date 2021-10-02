class Menu
  attr_reader :list, :range

  def initialize
    @list = {
      "Mac & Cheese" => 7.50,
      "Garlic Bread" => 3.00,
      "Lamb Chops" => 9.50,
      "Pizza Margherita" => 8.00,
      "Pizza Capriciosa" => 12.00,
      "Lasagna" => 11.25,
    }
    @range = {}
  end

  def see_menu
    @list.each_with_index do |(item, price), index|
      @range[index + 1] = item
     "#{index + 1} #{item} = £#{price}"
    end
  end
end
