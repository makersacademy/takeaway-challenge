require_relative '../lib/order.rb'

describe Order do
  describe '#add(item, number = 1)' do
    it 'should add the item to the order list' do
      subject.add('name1')
      expect(subject.order).to eq(['name1'])
    end

  end

end
