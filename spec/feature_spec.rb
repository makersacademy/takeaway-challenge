require 'menu'

describe 'Feature test' do
  subject { Menu.new }

  context Menu do
    it 'Can have five items added and then pretty printed' do
      number_of_times = 5
      dish_names = ['Dish one', 'Dish two', 'Dish three', 'Dish four', 'Dish five']
      dish_prices = [4.50, 5.00, 4.70, 8.00, 6.25]

      number_of_times.times { |i| subject.add_dish(dish_names[i], dish_prices[i]) }
      expect(subject.dishes.length).to eq 5

      expected_print_dishes_output = []
      number_of_times.times do |i|
        expected_print_dishes_output <<
        "#{i + 1}. #{dish_names[i]} - £#{dish_prices[i]} \n"
      end

      expect(subject.print_dishes).to eq expected_print_dishes_output.join
    end
  end
end
