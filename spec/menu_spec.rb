require 'menu'

describe Menu do

  let(:dish) { double(:dish, name: 'korma', options: {chicken: 5.95, prawn: 6.95}) }
  subject(:menu) { described_class.new([dish])}

  describe '#view_full_menu' do
    it 'returns a readable list of dishes, options and prices' do
      chicken_name = dish.options.keys.first
      chicken_price = dish.options.values.first
      prawn_name = dish.options.keys.last
      prawn_price = dish.options.values.last
      dish_string =
      "1. #{dish.name.capitalize}:\n" +
      "     #{symbol_to_string(chicken_name)}: £#{chicken_price}\n" +
      "     #{symbol_to_string(prawn_name)}: £#{prawn_price}\n\n"
      expect { menu.view_full_menu }.to output(dish_string).to_stdout
    end
  end

  describe '#select_dish' do
    context 'when passed a dish name and option name as a string' do
      it 'returns a hash of the selected dish with price' do
        allow(dish).to receive_messages(get_price: 5.95)
        expect(menu.select_dish('korma', 'chicken'))
          .to eq({chicken_korma: 5.95})
      end
    end
  end

end
