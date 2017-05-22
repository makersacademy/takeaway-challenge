require_relative 'dish'

class Menu

  def initialize(dishes = Array.new)
    @dishes = dishes
  end

  def <<(dish)
    @dishes << dish
  end

  def show_menu
    @dishes.map.with_index do |dish, number|
      "#{number + 1}. #{dish.name}, £#{'%.2f' % dish.price}"
    end.join(", ")
  end

  def select_dish(dish_name)
    @dishes.find { |dish| dish.name == dish_name.downcase }
  end

  def contain_dish?(dish_name)
    @dishes.any? { |dish| dish.name == dish_name.downcase }
  end
end

# Test!!!
# dish_list = double(:array)
# menu = Menu.new(dish_list)
# expect(dish_list).to receive(:<<).with ('pizza')
# menu << 'pizza'
