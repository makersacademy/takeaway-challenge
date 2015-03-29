require 'dish'

describe Dish do
  let(:dish) { Dish.new('pizza', '£6') }
  context 'when created' do
    it 'has a name' do
      expect(dish.name).to eq 'pizza'
    end
    it 'has a price' do
      expect(dish.price).to eq '£6'
    end
    it 'is available' do
      expect(dish).to be_available
    end
    xit 'has an initial quantity' do
    end
  end

  context 'when a client order is being processed' do
    xit 'knows its actual quantity' do
    end
    xit 'knows that it\'s available' do
    end
    xit 'knows when it becomes unavailable' do
    end
    xit 'can be ordered if available' do
    end
    xit 'can be ordered in quantity if available' do
    end
    xit 'cannot be ordered if unavailable' do
    end
    xit 'cannot be ordered in quantity if more than available' do
    end
  end
end
