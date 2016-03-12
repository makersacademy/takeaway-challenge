class Menu

  attr_reader :dish_list

  def initialize dish_list
    @dish_list = dish_list
  end

  def list_dishes
    current_menu = ''
    @dish_list.each do |dish|
      current_menu << "#{dish.dish_name}: #{dish.dish_price}£\n"
    end
    current_menu
  end

end
