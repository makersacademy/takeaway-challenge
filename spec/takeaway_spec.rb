require 'takeaway'

describe Takeaway do
  let (:menu_items) {[
    {name: "item_one", price: 2.50, quantity: 1}, 
    {name: "item_two", price: 5.00, quantity: 1}
    ]}
  let (:menu) { double(:menu, items: menu_items)}
  let (:order) {double(:order, current: [{name: "item_one", price: 2.50, quantity: 1}])}
  subject {described_class.new(menu, order)}

  describe '#menu' do
    it 'displays all items on menu' do
      expect(subject.menu.items).to eq(menu_items) 
    end
  end

  describe '#order' do
    it 'displays the current order' do
      expect(subject.order.current).to eq(order.current)
    end
  end

  describe '#add_to_order' do
    context 'when items are available' do
      context 'when item not in order already' do
        it 'adds item to order' do
          subject.add_to_order("item_two", 1)
          selected_item = {name: "item_two", price: 5.0, quantity: 1}
          expect(subject.order.current.last).to eq(selected_item)
        end
      end
      context 'when item in order already' do
        it 'updates the quantity' do
          subject.add_to_order("item_one", 1)
          expect(subject.order.current.first[:quantity]).to eq(2)
        end
      end
    end
  end
end
