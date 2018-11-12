class Menu

  DISH_LIST = {
          'chicken korma' => 5,
          'chicken bhuna' => 6,
          'lamb rogan josh' => 7,
          'plain rice' => 1,
          'pilau rice' => 2,
          'plain naan' => 3,
          'peshwari naan' => 4
        }

  attr_reader :dish_list

  def initialize(dish_list = DISH_LIST)
    @dish_list = dish_list
  end

  def display_menu
    @dish_list.each do |item, price|
      "#{item} £#{price}"
    end
  end

end
