require './lib/order'
describe Order do
  describe '#add' do
    it 'add items from the menu to the order' do
      expect { subject.add("dish", 20, 1) }.to(change { subject.order })
    end
  end
end
