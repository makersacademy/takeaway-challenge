require 'menu'

describe Menu do
  subject(:test_menu) {described_class.new dummy_list}
  let(:dummy_list) {Array.new(3) {dummy_dish}}
  let(:dummy_dish) {double :dish, dish_name: :banana, dish_price: 3}

  describe '#initialize' do

      it 'can be initalized with a given list of dishes' do
        expect(subject.dish_list).to eq dummy_list
      end

  end

  describe '#list_dishes' do

    it 'fetch name info for the dishes in the menu' do
        expect(dummy_dish).to receive(:dish_name).exactly(3).times
        test_menu.list_dishes
    end

    it 'fetch price info for the dishes in the menu' do
      expect(dummy_dish).to receive(:dish_price).exactly(3).times
      test_menu.list_dishes
    end

    it 'returns a human-readable list of available dishes and price' do
      expect(test_menu.list_dishes.class).to eq String
    end

  end

end
