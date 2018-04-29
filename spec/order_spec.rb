require 'order'

describe Order do
  describe '#items' do
    it 'uses an array to store order items' do
      expect(subject.items).to be_instance_of(Array)
    end
  end

  describe '#total' do
    let(:dish) { double :dish , name: 'Curry', price: 5 }
    let(:dish2) { double :dish , name: 'Chips', price: 2 }
    it 'finds the sum of of dish prices and returns result' do
      subject.items += [dish, dish2]
      expect(subject.total).to eq(7)
    end
  end

end
