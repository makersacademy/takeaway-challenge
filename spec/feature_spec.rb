require 'menu'

describe 'Feature test' do
  subject { Menu.new('mock') }

  context Menu do
    it 'Can have five items added and then pretty printed' do
      dish_names = ['Dish one', 'Dish two', 'Dish three', 'Dish four', 'Dish five']
      dish_prices = [4.50, 5.00, 4.70, 8.00, 6.25]

      5.times { |i| subject.add_dish(dish_names[i], dish_prices[i]) }
      expect(subject.dishes.length).to eq 5

      expected_print_dishes_output = []
      5.times do |i|
        expected_print_dishes_output <<
        "#{i}. #{dish_names[i]} - £#{dish_prices[i]} \n"
      end
      
      expect(subject.print_dishes).to eq expected_print_dishes_output.join
    end
  end
end
