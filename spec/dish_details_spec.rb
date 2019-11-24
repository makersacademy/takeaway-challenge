require 'dish_details'

describe Dishes do
  subject(:dishes) { described_class.new }
  let(:name) { double :name }
  let(:price) { double :price }
  let(:quantity) { double :quantity }
  let(:menu_list) { { quantity: quantity, name: name, price: price } }

  describe '#insert_a_dish' do
    it { is_expected.to respond_to(:insert_a_dish).with(3).argument }

    it 'saves a dish' do
      save = dishes.insert_a_dish(quantity, name, price)
      expect(save).to eq [menu_list]
    end
    # it 'to receive an integer argument - quantity' do
    #   allow(quantity: quantity).to receive(5) { :quantity }
    #   expect(dishes.insert_a_dish(quantity, name, price)).to be_a_kind_of(Integer)
    # end
  end
end 

describe Menu do
  subject(:menu) { described_class.new }
  let(:dishes) { Dishes.new }

  describe 'printed_menu' do
    it 'returns the list of dishes with its prices' do
      expect(menu.printed_menu(dishes)).to eq(dishes)
    end
  end
end