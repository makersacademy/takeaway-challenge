require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new }
  let(:selection) { double("Galloway Tartare")}

  describe '#menu' do
    context 'when requesting to see menu' do
      it 'should show menu' do
        expect(restaurant.steakhouse).to eq restaurant.steakhouse
      end
    end
  end

  describe '#order' do
    context 'when ordering from the menu' do
      it 'should add order to basket' do
        expect(restaurant.order).to eq selection
      end
    end
  end

end
