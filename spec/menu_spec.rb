require 'menu'

describe Menu do
  subject(:test_menu) {described_class.new dummy_list}
  let(:dummy_list) {Array.new(3) {dummy_dish}}
  let(:dummy_dish) {double :dish, dish_name: nil, dish_price: 3}

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

  describe '#retrieve_dishes' do

    it 'return an array of the available dishes' do
      expect(test_menu.retrieve_dishes).to eq dummy_list
    end

  end

end
