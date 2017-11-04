require 'menu'

describe Menu do

  let(:dish) { double(:dish, name: 'korma', options: {chicken: 5.95, prawn: 6.95}) }
  subject(:menu) { described_class.new([dish])}

  describe '#view_dishes' do
    it 'returns a readable list of dishes, options and prices' do
      chicken_name = dish.options.keys.first
      chicken_price = dish.options.values.first
      prawn_name = dish.options.keys.last
      prawn_price = dish.options.values.last
      dish_string =
      "#{dish.name.capitalize}:\n" +
      "#{chicken_name.capitalize}: £#{chicken_price}\n" +
      "#{prawn_name.capitalize}: £#{prawn_price}\n\n"
      expect { menu.view_dishes }.to output(dish_string).to_stdout
    end
  end

end
