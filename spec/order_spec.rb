require 'order'

describe Order do

  subject(:order) { described_class.new }

  describe '#show_list_of_all_dishes' do

    it 'prints all the dishes that are in the dish list' do
      test_dish = Dish.new("Chicken Korma", 6.00)
      subject.dish_list.add_dish_to_list(test_dish)
      expect(subject.show_list_of_all_dishes).to eq [test_dish]
    end
  end
end
