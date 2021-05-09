require 'takeaway'
describe Takeaway do
  let (:menu) { double(:menu, items: [{name: "item_one", price: 2.50}, {name: "item_two", price: 5.00}]) }
  let (:order) {double(:order, current: [{name: "item_one", price: 2.50}])}
  subject {described_class.new(menu, order)}

  describe '#menu' do
    it 'displays all items on menu' do
      expect(subject.menu).to eq(menu) 
    end
  end

  describe '#order' do
    it 'displays the current order' do
      expect(subject.order).to eq(order)
    end
  end
end
