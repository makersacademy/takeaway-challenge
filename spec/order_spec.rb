require './lib/order'
describe Order do
  context '#add' do
    it 'add items from the menu to the order' do
      expect { subject.add("item", 20, 1) }.to change { subject.order }
    end
  end
end