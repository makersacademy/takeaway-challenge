require 'takeaway'

describe Takeaway do
  let (:menu_items) {[
    {name: "item_one", price: 2.50, available_quanity: 1}, 
    {name: "item_two", price: 5.00, available_quanity: 1}
    ]}
  let (:menu) { double(:menu, items: menu_items)}
  let (:order) {double(:order, current: [{name: "item_one", price: 2.50, quantity: 1}])}
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

  describe '#add_to_order' do
    context 'when items are available' do
      it 'adds item to order' do
        subject.add_to_order("item_one", 1)
        expect(subject.order.current.length).to eq(2)
      end
    end
  end
end
