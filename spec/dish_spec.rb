require 'dish'

describe Dish do
  let(:dish) { Dish.new }
  context 'when created' do
    it 'has a name' do
      pizza = dish.name
      expect(dish.name).to eq pizza
    end
    xit 'has a price' do
    end
    xit 'is available' do
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
