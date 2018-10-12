require 'customer'
require 'menu'
require 'dish'

describe Customer do

  describe '#Check_list' do
    it ' Should recieve a list' do
      list = Menu.new
      dish = Dish.new("Cabage", 5)
      list.add_dish(dish)
      expect(subject.check_menu(list)).to eq list.list_dishes
    end
  end
end
