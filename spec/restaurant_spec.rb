require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new }

  describe '#menu' do
    context 'when requesting to see menu' do
      it 'should show menu' do
        expect(restaurant.steakhouse).to eq restaurant.steakhouse
      end
    end
  end

end
