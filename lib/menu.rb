class Menu

  def initialize dish_list
    @dish_list = dish_list
  end

  def list_dishes
    current_menu = ''
    @dish_list.each.with_index do |dish, index|
      current_menu << "#{index+1}: #{parse_name dish.dish_name}, #{dish.dish_price}£\n"
    end
    current_menu
  end

  def retrieve_dishes
    @dish_list.dup
  end

  private

  def parse_name name
    name.to_s.tr '_' , ' '
  end

end
