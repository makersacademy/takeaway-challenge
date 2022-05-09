require 'dish'

describe Dish do
  let(:dish) { Dish.new('Fries', 1.99) }

  describe 'Name' do
    it 'should have a name for each dish' do
      expect(dish.name).to eq 'Fries'
    end

    describe 'Price' do
      it 'should show the price of a dish' do
        expect(dish.price).to eq 1.99
      end
      it 'should only hold numbers' do
        # expect{ Dish.new('Apple', 'Fifty Pence')}.to raise_error "Can only price dish using numbers"
      end
    end

  end

end