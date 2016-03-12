require 'menu'

describe Menu do
  subject(:test_menu) {described_class.new dummy_list}
  let(:dummy_list) {{dish_1: 1, dish_2: 2 }}

  describe '#initialize' do

      it 'can be initalized with a given list of dishes' do
        expect(subject.dish_list).to eq dummy_list
      end

  end

  describe '#list_dishes' do

    it 'returns a hash of available dishes and price' do
      expect(test_menu.list_dishes).to eq dummy_list
    end

  end

  describe '#retrieve_price' do

    it 'returns the price of a dish' do
      expect(test_menu.retrieve_price(dummy_list.keys.first)).to eq dummy_list.values.first
    end

  end

end
